Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CC5C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 13:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxFACcZSg9jdFJMF6rmUZ+dSf6/n4Bae3xVZCZ/pLgY=; b=zs9bg1aDr2SKU7gbbwdPLyqX/7
	RYzLDmhlijUWiT8hGNuf+ygwk/QBuSkfAjgkhEzgD9LEOy6wF7XCX0MyStbK9XOm4dkK6yruuEFwd
	NZtY2IqdNAbwfYwYhkDATzTesiLsnJQEeCs2n0mgLiHDmjqiSyNzkIvGJ8IV3OsAxgTVsBz0b2haW
	ccb2XCreZS1EudSVgHEdBTRaKsZWbMtX2XxRxUMJM5D8tCEDzfv3Wy+I6RogvOSzcyCtQWyVD2cdD
	WcQmqedxvZhrsCIAKNPNfxAjhm570FJm9NvpXFA8/cPKEuzHCK/PE1CIBCRNzTZ/NtlFRIRpIvaxv
	dvDrxDNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZRz-00000006wpu-32yN;
	Mon, 07 Sep 2026 13:31:55 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZRw-00000006wpB-46Gp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 13:31:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1788787912;
 bh=VxFACcZSg9jdFJMF6rmUZ+dSf6/n4Bae3xVZCZ/pLgY=;
 b=ZIaDiUS6aQGLQrDTKRbEgZtiprW0Bxdp/+DCiw8G5c3WkliUHKYGD7uoBvKZP5UBfY/+Dydru
 xZlVeo6s+nMH6znBrmY/j+KBPYgnR0NkjtuzTsiZPIshojjZvuRQcgYS+QJdEqVo3C2OMoNiY2J
 ZSzdo+FJYQDqXvOovqjVcFyHxtcOSc0gk+lwJ9M5ZoX0GUSf1P8zpkpaKLUJZfXk9htvwIuVRFY
 Uv0Pvl2C3V5vo/PK3M0qWJ8TPWiSOoAeObgj8lCjoI/ylJ/Gka1Oh2gXkFtb2Z7QQfK6qBSwU4y
 Sy/XOLLBRujRfOJVivbm4JgVuJ4Hh6siCsCVrj2z+G/A==
X-Forward-Email-ID: 6a9ebcb816171017b32bae93
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Mon, 07 Sep 2026 09:31:34 -0400
Message-Id: <DL94DYGNRZC8.18LI4590FX0S3@ubuntu.com>
Cc: "Konrad Dybcio" <konradybcio@kernel.org>, <linux-usb@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 02/22] usb: typec: Represent USB4 on the Type-C bus
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Sven Peter" <sven@kernel.org>, "Heikki Krogerus"
 <heikki.krogerus@linux.intel.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Janne Grunau" <j@jannau.net>, "Neal Gompa" <neal@gompa.dev>, "Andreas
 Noever" <andreas.noever@gmail.com>, "Mika Westerberg" <westeri@kernel.org>,
 "Yehezkel Bernat" <YehezkelShB@gmail.com>, "Philipp Zabel"
 <p.zabel@pengutronix.de>
X-Mailer: aerc 0.21.0
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-2-1f80085f93fb@kernel.org>
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-2-1f80085f93fb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_063153_143373_5C9810B2 
X-CRM114-Status: GOOD (  12.23  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun Sep 6, 2026 at 2:36 PM EDT, Sven Peter wrote:
> USB4 technically isn't alternate mode and entered using the EUDO and has
> no SVID or Discover Modes Response. We can still represent it like an
> altmode on the Type-C bus though by adding a mode kind. Exclude the USB4
> modes from any SVID-specific operations and driver binding, but allow
> consumers to observe their state through notifications.
>
> Like for other altmodes, expose the USB4 mode to sysfs: Add a mode_kind
> to be able to differentiate and then expose the EUDO, make the USB4
> active state read-only since we only represent firmware-negotiated USB4
> modes and omit anything that only applies to SVID-specific altmodes.
>
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
> Hope it's fine to add you as the contact for the sysfs documentation,
> happy to add myself otherwise though.
> ---
>  Documentation/ABI/testing/sysfs-bus-typec | 36 ++++++++++++++
>  drivers/usb/typec/bus.c                   | 67 ++++++++++++++++++++-----
>  drivers/usb/typec/class.c                 | 83 +++++++++++++++++++++++++=
++----
>  drivers/usb/typec/mode_selection.c        |  6 ++-
>  include/linux/usb/typec.h                 | 20 +++++++-
>  include/linux/usb/typec_altmode.h         | 10 +++-
>  6 files changed, 193 insertions(+), 29 deletions(-)
>

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>


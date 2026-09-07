Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BADC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 13:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7VvGigwn27AdfNBSG1mKimtn1nQapTyJ3WDolaxsys=; b=PuhD9H9JwrBCGYgKxZ2tXaUfNH
	r5LzkJDLgZXcuvtAqdA3NCg7NxXiOUddtC6UwGsEShekvbCX7T1nPk9ojL1rnpFcK9CTZBMW5B647
	EK76VPG33Ik1XaFy7UTpNRZzZKZrHtuyBO+1hufC8wnHglKpeSIzG5Ew5y3AjWBrfkZaTOezTh/Dv
	6Jzvz/G4s3LqQclNPl2SLesFfn0xfx+1LycKwHt4cljfKaLBX7GfCXtLwaotqmrJopKm30ljzOE8o
	bFcGhYd5Lt1la/XzvHw55Bjzedns00WMKOTC3Kao3+d62tDYECrn7SyVwBeAHQKBQKrJEeqJwUfLo
	YQebCSIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZNT-00000006w1R-0Z66;
	Mon, 07 Sep 2026 13:27:15 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZNP-00000006vzz-41Io
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 13:27:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1788787630;
 bh=y7VvGigwn27AdfNBSG1mKimtn1nQapTyJ3WDolaxsys=;
 b=V2B0iXlIsS3+EnjdFjC3qPSNYl7sm6NaLCbGA1L7RNb0OQxOnL5QFClTktGYY1v5YVD0ouDfv
 PNqc/ZuRp6+DpvUM8SWpI8y4Pum1puy/sgYjzqUeLr0wSGbXx2GalwTOFqJjKwV1B16maq+TTjT
 dCTfT8UA4po/SRoHUB2Tx7u3Lru1VaG/sX3xBgb74H8blOqAr0lflTcrj2misOfr+VN4P6PKU3e
 epvD1vrw/SJSg/BjXPXQ7RiMKX5A6j4LSdQ877ISFaldzXmYIwO4ezc9/2AWKFtT7sPscSfrnQp
 7GELo5W0HiiCaK052IxHhvTkG9rbievfit2bFHOZzqLA==
X-Forward-Email-ID: 6a9ebbaa16171017b32ba5b2
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Mon, 07 Sep 2026 09:27:04 -0400
Message-Id: <DL94AI9QUZEG.LE27ALKI8UIX@ubuntu.com>
Cc: "Konrad Dybcio" <konradybcio@kernel.org>, <linux-usb@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 01/22] usb: typec: Add alternate mode state notifiers
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
 <20260906-b4-apple-soc-tbt-v2-1-1f80085f93fb@kernel.org>
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-1-1f80085f93fb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_062713_000476_759F18FA 
X-CRM114-Status: GOOD (  17.37  )
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
> The Apple Silicon USB4/Thunderbolt driver needs to be made aware of
> cable details and whenever USB4 or Thunderbolt is entered. The cable
> details are already available as part of the typec subsystem but there
> is no way to get a notification on typec_altmode_update_active() so
> far.
>
> Add a blocking notifier chain to each alternate mode and call it
> whenever the mode is activated or deactivated right next to the already
> existing sysfs and kobject_uevent notifications. Replay activations when =
a
> notifier is registered.
>
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/usb/typec/bus.h   |  6 +++++
>  drivers/usb/typec/class.c | 59 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  include/linux/usb/typec.h | 16 +++++++++++++
>  3 files changed, 81 insertions(+)
>
> diff --git a/drivers/usb/typec/bus.h b/drivers/usb/typec/bus.h
> index 7df5deb1dd3a..4dc60c48c91e 100644
> --- a/drivers/usb/typec/bus.h
> +++ b/drivers/usb/typec/bus.h
> @@ -3,6 +3,8 @@
>  #ifndef __USB_TYPEC_ALTMODE_H__
>  #define __USB_TYPEC_ALTMODE_H__
> =20
> +#include <linux/mutex.h>
> +#include <linux/notifier.h>
>  #include <linux/usb/typec_altmode.h>
> =20
>  struct typec_mux;
> @@ -23,6 +25,10 @@ struct altmode {
> =20
>  	struct altmode			*partner;
>  	struct altmode			*plug[2];
> +
> +	/* Serializes active state changes and notifier registration. */
> +	struct mutex			state_lock;
> +	struct blocking_notifier_head	state_notifier;
>  };
> =20
space/tab formatting


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A72ECA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 18:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13cN8JU64iajFlEX+h1JrkP7aLjhk7aGt6y5dtIBswg=; b=3GzBlCe3NzQM6mtjdM3SeO/JON
	Z6qZ7BGrsf56sjcAM8vvdmnHkrneHJ8vmqClVAZbfvMM0/UQr5iMNU0XULDmOzM0NVmeaMTj827xz
	49s2rEMQq3WIg7bvzRutCu08YR7iuSB2Pwk1DG2Rc2igvuRI/0FuNzr/lXnWmWYnK0yGwtCxPQTc5
	87YROMiS8uZMUPDTmG95bdAf79DEF62kLfliXzD6b+i8JLsKGbQ2FLyUBrHheKPViA90GFCZxwxA2
	ez5bdF1cv3+6XDr/AQNwenEtemy+9kC/OXUefOmDpFtgUamZYZ0OE4r2ydV2M9B4W+sb9+WyHM4O3
	13nNjWrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBG4L-00000001JoM-1wwx;
	Mon, 28 Sep 2026 18:27:17 +0000
Received: from lpdvsmtp10.broadcom.com ([192.19.144.205] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBG4J-00000001JnM-0qiG;
	Mon, 28 Sep 2026 18:27:16 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 0CEB1C0003E2;
	Mon, 28 Sep 2026 11:27:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 0CEB1C0003E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1790620033;
	bh=JjjBmWktjdoJv05RbzHhroU2fEeisbv1xo0hT/+ewT4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u79k51rrwQNZGS1jg8Vdxl2LfY1lVOSMquxi36lxQVKAbGQAt229tvel0elbOLqYn
	 j19N2pcDHbkfw0b9vOG7T1B31zdeAF+FPtI0WwhfefcknegPAMgMIOYJvgR4+oRYzH
	 MX7GbOdhV/+wcYj5po4IE4lIBwDz6twS8PYpfX6Y=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id A028DACC;
	Mon, 28 Sep 2026 11:27:12 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Peter Robinson <pbrobinson@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] arm: dts: bcm2711: Add wakeup and alias to cm4 rtc
Date: Mon, 28 Sep 2026 11:27:12 -0700
Message-ID: <20260928182712.1268776-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925065400.2248660-1-pbrobinson@gmail.com>
References: <20260925065400.2248660-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_112715_335600_798E9430 
X-CRM114-Status: UNSURE (   8.49  )
X-CRM114-Notice: Please train this message.
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Fri, 25 Sep 2026 07:53:48 +0100, Peter Robinson <pbrobinson@gmail.com> wrote:
> The pcf85063 on the CM4 IO carrier board is capable of wake up
> so set the parameter, also add it as an alias to rtc0.
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian


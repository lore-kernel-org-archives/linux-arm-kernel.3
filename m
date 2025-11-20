Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D547CF9C72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=omA3JNUTqVXvhL3maREtp6C8QOqiK2rJLzGffP+n1vo=; b=aFhT9BYkhaJQYkLz4DNF7iJIl1
	om1lzej0WHZb1gSIYG+HMpVM4bhmlk4tYMVMGRHePSb9xOYcXrCpL7m1w3e6cNf7gOMsC5nr3W1SB
	XPjYlPgLvum3yIbRDMLwI6WQGhTQM/vwMSJbQXtiXP8rSvBN+tCSjSoW+Ob1mHaEtH+D501SLqtPJ
	8YuebSQSSP2qyvss+XxahNoJ6BZ8wNkwX+duzNtYSv4VQG1F8/u0n52uMxnQ6upfdyAS92Q2+f8Y6
	CPTCJbjiZOkmZLqr81kRmiUvDLEsZ1DpxdwXaJvL99oCROzSR5ZMdjKCI5gP22oT3Adna3IWwQ/ug
	VLXjywIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8CZ-000000074ON-2c10;
	Thu, 20 Nov 2025 17:12:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8CW-000000074Lv-0Vnv;
	Thu, 20 Nov 2025 17:12:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B8F0240DAB;
	Thu, 20 Nov 2025 17:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F1E4C116D0;
	Thu, 20 Nov 2025 17:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763658727;
	bh=mHyQXOCfUEu3/8Ya1tUCqfJKlgAxb9fCkFtOdrJ4sqo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=dVw1rNdRNoq8Xib0X0bjU5pBVXr56M/7OELZiMq3qEM64g+qqSpbC9AtbGdMPwUtY
	 /gupB6Z4jKM44NuY5MIhqUjcjbI654r+cFc3PJZzGfenmL3ZCxykFuUQYQfG59aaAN
	 h9Ou9Lkyb1uOWkLzAeTiWNPXd3+b0kUoHy3Q3yD5/ePM7Yd4fCZMK9A7dOftB7e4XM
	 maXTGCM+ofAMF7vXJP5kuEgWjhkxtggWTi/Y7U/XfQG1qCiMaqn02odENr+NOODGOT
	 aLDEvP8eHjhFz7JVwXIsH0Ildnbx077Xfye5IbansaERIWgY5CpxATq3GaOKTJbGj/
	 8W8u5D7+Tc/4w==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com, Frank.Li@nxp.com, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>
In-Reply-To: <20251118071947.2504789-1-xu.yang_2@nxp.com>
References: <20251118071947.2504789-1-xu.yang_2@nxp.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: imx8mq-usb: add alternate
 reference clock
Message-Id: <176365872319.207696.9701764903294048146.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 22:42:03 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_091208_194972_E661781B 
X-CRM114-Status: UNSURE (   4.29  )
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


On Tue, 18 Nov 2025 15:19:46 +0800, Xu Yang wrote:
> Beside default 24MHz clock input, there is an optional additional 100Mhz
> clock input 'alt' for USB PHY reference clock.
> 
> 

Applied, thanks!

[1/2] dt-bindings: phy: imx8mq-usb: add alternate reference clock
      commit: 0e8fe19c0292d9912460b25043292227d5f1fdb2
[2/2] phy: fsl-imx8mq-usb: support alternate reference clock
      commit: 3b64ea4768e7e64b2d9ae5833dbcac19f6212145

Best regards,
-- 
~Vinod




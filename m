Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BE6C369A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 12:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nn6BHrljoqZ0kMz7vfqNAeHSD7WrqEw0Y0Tb2kgvvsk=; b=Pjo5fm5KE4Dkh9Jk7dxMypEBGT
	yF/J8pht6uafCdxctJdkK6cfGPbLRPSF6zeqCVYTgzyPwuC5WdBawlUu31iOEhTbmJXae/Nd0H+sU
	q1GOXwJsH/8R+QhiZ3bxMk+vvjO9wVTqlPhXakuTUv18Myy3+wgPTqkBLw70GIGmXCTCz69zBw/Vl
	5hqBQqHL2ZrZ/sf8Cvw5YW+OGjP9fR4zZVtwj5rX7vQoFyp83PHlqAG0b5Wdk7NXZSEvvpviGog4i
	2rvqh8Fzv0jjx4PuQ6trolAb5Tb7fJYyJYRj56+kSZVyiBLRhs3BvkpLO3KLJPMESgPi2FSEv3hC7
	+q+K53ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3DMH-0000000DiOC-0HAV;
	Fri, 11 Apr 2025 12:19:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3DDp-0000000DgdB-2mBX;
	Fri, 11 Apr 2025 12:11:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 01DDA5C6922;
	Fri, 11 Apr 2025 12:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D531C4CEE7;
	Fri, 11 Apr 2025 12:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744373460;
	bh=41ecM6L8w8kkRS1191n4/4NDFsdX+DlRIppgjV1rIoI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BAtcGjSudD5vzmTpscne+M3QMVDWTTzdpd7I7uB2ug3xGnz8McgamKUSVqhkIdAjD
	 Ayu1+jPYnoLjvpi3sonmP7plJctaFF75yJPs/98kR6GISzsTTJHlX6LAssgpUlJuiO
	 p2iRVtEw2cx0ZMeS2vmsIH6CF7gPlg14RO+wBEnhNDN3yPvDe0aKPxqIIZURBnnzN1
	 hY7z7ROr3V9rYSSELY8QPWrvGlubMPLVproh4PcFXPoAZbGMRKdpm30L8X1aqANoMX
	 elXWsRd8BJi8wN72V5hv7DDaSLdUArvJC04zlyIVVwoQukxREX8aCXFof+yU+s16Rk
	 f1V+OAzvnf03g==
From: Vinod Koul <vkoul@kernel.org>
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-phy@lists.infradead.org, justin.chen@broadcom.com
Cc: rafal@milecki.pl, alcooperx@gmail.com, 
 bcm-kernel-feedback-list@broadcom.com, florian.fainelli@broadcom.com, 
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, kishon@kernel.org
In-Reply-To: <20250402185159.2976920-1-justin.chen@broadcom.com>
References: <20250402185159.2976920-1-justin.chen@broadcom.com>
Subject: Re: [PATCH v3 0/2] phy: usb: add support for bcm74110
Message-Id: <174437345727.673939.14020168766242612778.b4-ty@kernel.org>
Date: Fri, 11 Apr 2025 17:40:57 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_051101_759855_F660F898 
X-CRM114-Status: UNSURE (   5.72  )
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


On Wed, 02 Apr 2025 11:51:57 -0700, justin.chen@broadcom.com wrote:
> bcm74110 adds a freerun utmi/ref clock that saves furether power during
> suspend states. A tune is also necessary to pass USB compliance test.
> 
> Justin Chen (2):
>   dt-bindings: phy: brcmstb-usb-phy: Add support for bcm74110
>   phy: usb: add support for bcm74110
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: brcmstb-usb-phy: Add support for bcm74110
      commit: 0fbceff4f873500f0d0e632ee2d1e84e9a67b1b4
[2/2] phy: usb: add support for bcm74110
      commit: 686b2730e4816e40e6a5432ff163993638397154

Best regards,
-- 
~Vinod




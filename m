Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB17CA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 15:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=23Y/2PgTxZUSaSmiQQfmGqgPefme+EflMV6C57Dhc+k=; b=xQEjLQLlTP8okoCvG5ZgX0NNxc
	dkePZwyDBNUrzaHaEfgCUHBmMhlf7bbRE+jM1q/ZHWjRJz9Fhwrj42pUMkrSylha6aioVmjha6Nmi
	ZgD55SAaSzDPwjMS3ffXf82AqFVzx1y3TRDi1oYC4LeHmgXC1magx3h8h+WnkJAUehSPySV9ycBal
	FCut3hsCRGXPo6lxMukk7is34Byv9zdYW7c6GI1V8I6T/JashagTYaLs+LOLQCUcLZJGF7qWIQeTB
	sSxMPw4PDRC7hpSu3pv2fD1iT+zJbdHFAHTDD41zR7SOgLOTvsznBjap3p5pcNhsfDunNYRnvVzb0
	W8FlSSEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD1c9-0000000Dgdx-3A80;
	Sat, 03 Oct 2026 15:25:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD1c8-0000000DgcX-3enI;
	Sat, 03 Oct 2026 15:25:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 012E660DA2;
	Sat,  3 Oct 2026 15:25:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 001C01F0089B;
	Sat,  3 Oct 2026 15:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791041127;
	bh=23Y/2PgTxZUSaSmiQQfmGqgPefme+EflMV6C57Dhc+k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MA8BBvY0ou10kc8WBVXZjL4stUd0LzlylLRTDrUop31oOaz6fkE8QYjQJF9aX4g74
	 cxxeRYPlFn7YiiDxiVbtof6pHcpcA8GA8Tlof/m6YOMeIfl6gTVgr+p6Pre6sgh8wZ
	 Pv1OKhKstaP9k6NxwECz95xX4OT4k2Ev0yNdGAuZJkKKP+o9uMdEKuY1n3iQkWt8yY
	 naO8oaIFK99O/JCIf04jL3UWM34vPeRWb/FVmXsydxmeL3VRURQaCIfixmhLt2U7oq
	 sCYwq/H/CISdQCG8ZZ3T31V4OsXBK/PtLnE05Fon9uLHOnOrYRpnH6LarRCWdzbs52
	 9FziDx0tLUByg==
From: Vinod Koul <vkoul@kernel.org>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Paul Cristian <p4ulcristian@gmail.com>, stable@vger.kernel.org
In-Reply-To: <20260821-b4-atcphy-usb4-v1-0-45c0b741e0c0@kernel.org>
References: <20260821-b4-atcphy-usb4-v1-0-45c0b741e0c0@kernel.org>
Subject: Re: [PATCH 0/3] phy: apple: atc: Prepare USB3-via-4 tunneling
Message-Id: <179104112470.223537.13101636843380037853.b4-ty@kernel.org>
Date: Sat, 03 Oct 2026 17:25:24 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Fri, 21 Aug 2026 15:50:26 +0200, Sven Peter wrote:
> This short series first fixes an oversight that prevents USB2 from
> working when DP AltMode with 4 lanes is used. Then it adds the required
> sequence to point dwc3's PIPE interface to the USB4 Native Host
> Interface which I plan to submit soon to support USB3-via-USB4 tunnels.
> 
> Best,
> 
> [...]

Applied, thanks!

[1/3] phy: apple: atc: Support DUMMY PIPEHANDLER state in configure_pipehandler
      commit: a2fd3d1f4db720ac1deb477ce4811c5e4e60e5f8
[2/3] phy: apple: atc: Factor out the PIPE mux sequence
      commit: 8ca2e111117bf1d571f7c9de5d0dd91f5b770b11
[3/3] phy: apple: atc: Implement the USB4 pipehandler state
      commit: c319906aa47f8616019b01b1dd5c14eef293bb66

Best regards,
-- 
~Vinod




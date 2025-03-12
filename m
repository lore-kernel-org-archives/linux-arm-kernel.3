Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B361DC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 16:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYQNkQlou69ax3LhlnFW67151OjRYz6zSGzp1QT2Vqw=; b=PTks30M1hkRtN9kwN2uqFIZ4f8
	d+/ydIvbyVxI3KvUQziNCLucygsX9lQJ2J0tLM6arB4Io6H8bdXqW6vFMKERbX77bIu2ajoQKn9yn
	jMISLEBzG8dRB0glLrDYKpG/3yOtUCXBky40n6tEcCxpnOe2Hqb2ZfYvqAVgKkT0sfY1NfECClF6Q
	ZtBnd4pilp7IwBLcg291Rf3jVSaT33Y5FuCmkYcjsvPSFEu2Wke23CdbNuqq/ulYpSAcIQRja6iQj
	SFtCfplI6/9nZHpaqiIJN5lzm7IdCUz1TfCDyXl3OZMgCxT6wdDpruR9XaPNvs1biwr69yrC6iizy
	httcE1ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsOcw-00000008zDb-0M1g;
	Wed, 12 Mar 2025 16:08:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsOTV-00000008xOw-3Y0r;
	Wed, 12 Mar 2025 15:58:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2D86EA44B8D;
	Wed, 12 Mar 2025 15:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70897C4CEEA;
	Wed, 12 Mar 2025 15:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741795108;
	bh=osTh0kTm77SuvoIDJCJRCKF2vYvN9ddq8UlIlig7aSI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ba5AEwEMuiXy9lzz2AAXDXchDbnaxUC2VLXFluNn0DxBoH1aCLg62OX9bDhcPmp/i
	 R9dc3YS0PbeUX0XukfoSvDhnDKs0FIHzURFFH5If5UpOr+jQWIOH/e5NKl4WkgTETT
	 sdSzsktIAOgCt6pjlw1Faejmb1rwC7kkUddchkH7o9aTNLe1A1xjdQ8697OFh86ZFJ
	 cG/T5E//gGp2X3gbT13dd+pYx0ud9IC3GepR0Rm+mgWLbfiL+88kGgp7F/pgUSERXQ
	 MjRbsTiXVKK6vmYRoex6m6QM4oQBH/9OPnc+SuF4NjhcJoDpsBvHPuo0+VYWE7JaSN
	 H8tEBz9cO7Bgg==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250224220339.199180-2-thorsten.blum@linux.dev>
References: <20250224220339.199180-2-thorsten.blum@linux.dev>
Subject: Re: [PATCH] phy: rockchip: usbdp: Remove unnecessary bool
 conversion
Message-Id: <174179510715.536552.15016405189922821330.b4-ty@kernel.org>
Date: Wed, 12 Mar 2025 16:58:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_085829_954095_03AE3F7C 
X-CRM114-Status: UNSURE (   4.64  )
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


On Mon, 24 Feb 2025 23:03:39 +0100, Thorsten Blum wrote:
> Remove the unnecessary bool conversion and simplify the code.
> 
> 

Applied, thanks!

[1/1] phy: rockchip: usbdp: Remove unnecessary bool conversion
      commit: b52b330046d16f6e4ce94ae6fa349cc30af027b3

Best regards,
-- 
~Vinod




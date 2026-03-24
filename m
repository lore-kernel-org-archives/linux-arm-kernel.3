Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D33DFEC109
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 19:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MzOhvl+u7DFc28TQuo+xxqZEb1HSo2b+8jMDFMvc10M=; b=gcd1QFBut0CxMtM6oBd0rMGU5W
	D3uTWxAY8ld5Eog4Hff3cSWeaq5AhZJ07Sgn5RKAPi7vxylUMvY8YqlHazygm8oYawMpO1yQRrs5C
	SiDj+xupLku7BPMqo3r1vLFLAQP7Zc4DfNXcpFZuWRrjrLTJ8AHOx3a6M921n9diedmuDODCfAcO3
	dxyvHxXzG9yrEw9DYqF+q1+sHs3AmGk+5nRCvOX9vPBuehMPcQxJMaITIPjyIevPOfZ6ldGVpcGCv
	HUNGG3QUpG3VFF5wU4IKO1GFgsRN1e2l/IiClnmKADv9FrmMRRKR3DmbPupgzaQJ3OA7iqgUctmb4
	EwMyxc4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57pn-00000002BLP-2pMs;
	Tue, 24 Mar 2026 19:54:39 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57pO-00000002B6P-0zg7;
	Tue, 24 Mar 2026 19:54:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=MzOhvl+u7DFc28TQuo+xxqZEb1HSo2b+8jMDFMvc10M=; b=oDgTko9hw7llb4xFgm4VdKDqBw
	nQRbLMnIQkfGp2MKjzSRe61dXTzAsJh0CswTw36Kxe7TtqhGu2JRCZfspI4iUaUs2DK4M88leU5TS
	Zi3vkkhklzo1M2C0Uy7yxx+wxp0mjYZJTlFR9kNPyNYG1FsmOK3vpwH8MI71TY7wRKg3/CV3dwzn6
	kFFL0DhuENS/r+ivAUAdLINzYOVC4iPb65KLCnuZnswM/qRrlmAbYj7vpo8S28iTht+bvJKemy/+Z
	Gxqf7rQbXIwbtS/0IVWs+TpI2lWLJe8y5RZ0mkC/XsBAIiSg+pkbOKRLGuC3RxYSJDyXVjYy7cL5m
	LBKu0V9g==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Wunderlich <frank-w@public-files.de>,
	David Heidelberg <david@ixit.cz>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Martin Filla <freebsd@sysctl.cz>,
	Charalampos Mitrodimas <charmitro@posteo.net>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 0/4] Rework BPI-R2-Pro PCIe clock topology
Date: Tue, 24 Mar 2026 20:53:51 +0100
Message-ID: <177438200695.818857.2696783721404989897.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304-rk3568-bri-r2-pro-fix-pcie-v4-0-37abd7ba29d0@ixit.cz>
References: <20260304-rk3568-bri-r2-pro-fix-pcie-v4-0-37abd7ba29d0@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_125414_277906_013370AC 
X-CRM114-Status: UNSURE (   7.47  )
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


On Wed, 04 Mar 2026 12:05:26 +0100, David Heidelberg wrote:
> 


Applied, thanks!

[1/4] arm64: dts: rockchip: assign pipe clock to rk356x PCIe lanes
      commit: 27472814ac0bb465da1981788aad2463bc862848

The clock generator itself can use some rework, as suggested
in the review.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


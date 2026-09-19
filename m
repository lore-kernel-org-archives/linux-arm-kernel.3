Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F63CC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 06:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yIHY6mudo00cz0p3T/VlOqrX0X27ow/4zpk1QNBTOCw=; b=rn5UzujQ2XCQw7nQf2F0dZygv3
	QW2b/Uf0QFwA46Ol+uklHp3J5tm1Um4KpOF6183T5dwocOqi2RiV3u8ilY4ePnBZf26U2lTI+SXU3
	COLzxNLd7sFS2A5UkghvEWBQqr8duKffK2YNJaNoavvnG55O3kfoxjayXcBrNV7pIUTLkBPI0ErRb
	Z4LqIJ+S10AYJGVb6+mBHhT0Du7TFRxnbGYydiaQYF6Kmu+Wci05MBGi4aP5rgvae4n2AvKk+xY3g
	aIR7bS0JKvdnvPHyOu1cQ2iLhToIKK1jtREo/6pQMNfrqHrfpO7TTMb4NIcERCeNJH9vplHP2XVlU
	FcEwMppQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ony-0000000FzOp-11F3;
	Sat, 19 Sep 2026 06:44:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7onx-0000000FzOY-12Zc;
	Sat, 19 Sep 2026 06:44:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EBFA2601EF;
	Sat, 19 Sep 2026 06:44:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D751F000FF;
	Sat, 19 Sep 2026 06:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789800246;
	bh=yIHY6mudo00cz0p3T/VlOqrX0X27ow/4zpk1QNBTOCw=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=cOwR4GLEQlCxqtaISMmd/sURGaZE+EpbIV1zPB2BMp+X0KaRlm8Mt9mtkru86Yy6B
	 znkFE5DCae4WECtnFVVWMbCJzrEoAaLVsJzGBKYHEiqBdv680uvB+DbIlRYtYr5AET
	 cxPdIOO/3MNNdMAxnAIx7wpo7FlVFoe0vFSqZ7aAMqJEeoHi3JD1u1J2jlBV+bxI8a
	 IvuvHIM1d1yYDsy3QnFR/1np4Y+ubwCXS44OrVlFYZskXA5PH2+iBcqRBUo/G9k0L1
	 dII0AQ1QM2koTJNLlC9mc570it/A0Q5h1L2w0ceXeQyKhbnMV/tfALcNLRyGGQ5a0I
	 6UVfvgtAsLXRw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260829194140.108124-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260829194140.108124-3-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] ARM: dts: actions: owl-s500: Replace spaces
 indentation with tabs
Message-Id: <178980024256.89886.4198786322177939827.b4-ty@b4>
Date: Sat, 19 Sep 2026 08:44:02 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
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


On Sat, 29 Aug 2026 21:41:41 +0200, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").

Applied, thanks!

[1/2] ARM: dts: actions: owl-s500: Replace spaces indentation with tabs
      https://git.kernel.org/krzk/linux-dt/c/b1b254357cdacb95d485e5b0604ef2be33f85ce1
[2/2] arm64: dts: actions: Replace spaces indentation with tabs
      https://git.kernel.org/krzk/linux-dt/c/7445370b89363abb302d4e03af6fa2b599c3ae82

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>



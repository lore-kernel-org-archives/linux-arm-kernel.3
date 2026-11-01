Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7A26074135
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wG8pcIXb;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=O8zRDlrz;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=waKZaezF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LKx3D3L8i20KkgdM053WRZoZcyEWptAt+bunmlcQ35w=; b=wG8pcIXbhwymfe
	Ji3Z0xqG+uPCqVxeW/loPqCKiR2WdxMwgBG2FNXVgK9mccWrxwCJRWefmggsc0VuS3/dAV7Xb1HX2
	Db5IN3QYUqvwhDKxGLtuQBkKImiK32ezSkwfRBlWLNFopO42sKgtEV7tw4GkfgcxESpHeuSJZ4es6
	j+dc+LsYrI4Z5EDoyCQIHPsIV6pCEn9pM8VH+Y7dPc2QLQtYvdC5AMfPx0JAmVp36SshmEkuBAqWE
	b8doN8UtswC+7GP4xRfas3ctZKf7QfHULronw8IzMxDN5g7IiqL+9jzSK1ve90LM9emLcceWHCW46
	IEl/r6NBp4v02eV/lkyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrG-0000000F1nE-30TU;
	Sun, 01 Nov 2026 22:16:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqu-0000000F0f5-0aYh;
	Sun, 01 Nov 2026 22:16:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LKx3D3L8i20KkgdM053WRZoZcyEWptAt+bunmlcQ35w=; b=O8zRDlrz2DGoJ8qPlaRkBDXsLH
	Xpo1Ao0HKcjwMQjmhUYvqnp/W9HzZkrKxjmPg6vb/H7kttN7bsEVsncWU6yeQ0nJwXYjKFOm/gxl1
	G/IU4nR2U3mz6IjwOZjSHANjw4IfglLHG7TXjKxBbCK0xke9FSKMfph3qdObdxL/PUFfCqVpaSOsw
	AgyVd4EIdqiDlHJz6WHFMbIiqgE5Uv3oXw3hyU3adHH2KhC+a1sktSeVMyvFr0BYzR4Axaj4OWgQr
	2jcyywPkgXONFvyyVm8aIQFaRi5oEmSOXcVOo6LNc0FXKBC5Px7JDzV6Lvt3ivZFXaUP3RG6/QQKh
	V8obv05g==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqg-00000001seo-46yT;
	Sun, 01 Nov 2026 22:16:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=LKx3D3L8i20KkgdM053WRZoZcyEWptAt+bunmlcQ35w=; b=waKZaezFft+W4+DVAkBekptegW
	UnVtPxS4CWRmPMUfT3usNMXRPi8pgRhKiYrCC2qldwTF6kvbPud9Rv7dp711s66/Cn4JMTgHi4jE/
	Dan6sZi23Dgp9BRiTCR7QsGIrt1bO0O/kbzrt5213L9azRmU/aVc4z29eJoGXc9mYP/AOEd2P5Hti
	8HVpHlQ8NcnOSef9F2acRL0TLvgmxMqtbSeCZ2Nw5bKT7LAO1hk036BgG7raWsIcnEKJJVWnIefEE
	cagbA2Zxzi5h0KO962bVDJQPnzq6Vpv5qsRfmX0xor0slj/x1u/uwVDKKkJaw262eKa9Xvs0FTML2
	lMCkZ8Yw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Igor Velkov <iav@iav.lv>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] Label the fans on Kobol Helios64
Date: Sun,  1 Nov 2026 23:16:05 +0100
Message-ID: <179357136496.4108155.6955639670454082907.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261018-helios64-fan-label-v1-0-69a3f96d4efa@iav.lv>
References: <20261018-helios64-fan-label-v1-0-69a3f96d4efa@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_221624_717856_69D25D47 
X-CRM114-Status: GOOD (  10.05  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Sun, 18 Oct 2026 07:54:58 +0300, Igor Velkov wrote:
> Helios64 has two identical PWM fans, and userspace can tell them apart
> only by their platform device names. Patch 1 makes pwm-fan.yaml
> reference fan-common.yaml, as Rob suggested, which also allows label;
> the hwmon core already exposes it as the label attribute. Patch 2 names
> the fans after their headers, P6 and P7.
> 
> To: Guenter Roeck <linux@roeck-us.net>
> To: Jean Delvare <jdelvare@suse.com>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Heiko Stuebner <heiko@sntech.de>
> Cc: linux-hwmon@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: rockchip: Label the fans on Kobol Helios64
      commit: f80a26e10a39dd51061513db96fb525244e5e890

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


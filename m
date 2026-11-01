Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DCC607350A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KreCnOHt;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=nf3L9ctJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gmi5uewuXMed4CloBbecG8Sst+u3j+UWzS8NSli01pM=; b=KreCnOHtx5yKvb
	cNcxUEczaa8HmXQOqtqrFxK/Rlc1uOVPbKSBLQ2bhbjT6RjDK36eWbyTnSCOdMw8yCNu5BuTumf5d
	S+0f7DVS14aIi3nOavobMJqP6aJZTLeiTvgNTsRjfjkhPeRmdHCLEPGmWpPfwl8V4QwM1J152bRet
	umZWeA953tQRQd/7Q7WxcXgUSEe4b3f2JxeZ7i/F27CQBnkUqH1fJoR+8Cyd/nMzPBgHW8coDkdhk
	viTNsBC21fU2MQUMvotqSHN26dCfOaVuHWlbVON8EDX8JwDFXbfjbp/Zsda5HBsZ00VeYjf0jz/3k
	BXmBp+Hkkd2BZjxT7kLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdr9-0000000F1PL-3bpH;
	Sun, 01 Nov 2026 22:16:51 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqe-0000000Ezus-2EbV;
	Sun, 01 Nov 2026 22:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=gmi5uewuXMed4CloBbecG8Sst+u3j+UWzS8NSli01pM=; b=nf3L9ctJZheEiENewBWgF4O7d4
	w0woJPQP2GTmpWl74VRcox9MjZ2Deb0eqUSRtStoHXGL9DhHxYq/zlQ0L1r4t9itNO+dCC0ZdsZ8n
	W+9LJEcSSTVgssUnhNQiuK0NPTpjWQ4Nbv3mOzBC/MVuPYSf+pJvnH3bjamx7eHC6ePCrl6WXPiic
	+lj8Zub9f/PBFK9xwwmUasaTIwJhyjq4gviI/ZIo2RtaslKRJ/ANY3i8hKlbIV47ivDGORK6jO5XC
	ys8iroOQVCQIM2Wvc1Yj/kQFog6AZUqcQjtAQ623egtCoMp0dq8k7xjmlKYynPNJqpmIm3gT6/YAQ
	OsCudwrA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Igor Velkov <iav@iav.lv>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add the GPU to Kobol Helios64
Date: Sun,  1 Nov 2026 23:16:06 +0100
Message-ID: <179357136494.4108155.12651749876898512929.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011-b4-helios64-gpu-v1-1-bd83c6ecd19e@iav.lv>
References: <20261011-b4-helios64-gpu-v1-1-bd83c6ecd19e@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_141620_632681_4BEA8122 
X-CRM114-Status: GOOD (  10.27  )
X-Spam-Score: -2.1 (--)
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


On Sun, 11 Oct 2026 00:53:01 +0300, Igor Velkov wrote:
> The GPU core of Helios64 is supplied by U12, a Silergy SYR838 on i2c0
> at 0x41, with its VSEL pin on GPU_SLEEP_H (GPIO1_B6). Describe it as
> silergy,syr828, the way vdd_cpu_b (a SYR837) is described as
> silergy,syr827, and enable the GPU.

Applied, thanks!

[1/1] arm64: dts: rockchip: Add the GPU to Kobol Helios64
      commit: fb33952897e8a998bf026fee7f184b474a8381f1

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


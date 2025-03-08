Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238EDC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 17:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8LXHDhAYB6TjZVmdXZg1UdOS+iXYglhf0itTrkh9AbY=; b=zkZjVUNwxQ3aR8T0u8jfcgQLNn
	nKiYCiycQHq+nfacAAliWd4KULFdJkwCEFJhGfsMvUU00ee1AP8D3IyF6zTAnQi7CtUhMPcq5kQ4b
	9XyRVeKSPjKzC/NNM5wczNobfKgfbKQY1+SZx5E177qlQXAcRw+O6mTEFhkPl4Xpa38B9VsEDwv9/
	RnHACU01zyVqDbTBIbCibKMiB3T7WQe9xHdwz3YfKIAorBsKhkF2xD9tdgkrS+EjVBrdZsjhbTbj5
	v79OshWqUExLbKIf3O0h9vhDQez9U7TbYOKY8EXlu5OudghjdWG4PE5W18qTMzaJICnaW+BAf/54s
	fmEeiT+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqy8T-0000000GwMB-2cxt;
	Sat, 08 Mar 2025 17:38:53 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqy25-0000000GvXv-1drE;
	Sat, 08 Mar 2025 17:32:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8LXHDhAYB6TjZVmdXZg1UdOS+iXYglhf0itTrkh9AbY=; b=PEDm5aGOAKUXC+zhir1i3ceUY1
	ZymRUIjQyqM5l9Gt75lFhbHM6hNin+IHzWxWECrC4dNo/N0XY3xBounKRE9wQwulzizN1zqNLAs4O
	hrPTczHj5J8YVc0NAxEIoPBFRIt2sr6L/fVqVKw/FCBCm+/bIfR0ly6BrOS+fuQ8DAAHgTIgOt67F
	Vkaz6MWt6jxzEW8VliGi0iwRuiDiEuNb2OE6RPh8NDJxJLvG2Pc440eY0SjWZnGCqkZuJIBIJB9h9
	UgYGv+uz+yUzPFTc231+AYJ7tM79QUGMZGRyS+1xIMrBHYBbyDFZYVmYjqG2+DISUsC1/MQhJGSob
	Ye2F1+2w==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tqy1y-0004Tx-Cb; Sat, 08 Mar 2025 18:32:10 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: dts: rockchip: Add rk3528 QoS register node
Date: Sat,  8 Mar 2025 18:32:00 +0100
Message-ID: <174145503569.101861.837767867349168886.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250306123809.273655-1-amadeus@jmu.edu.cn>
References: <20250306123809.273655-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_093217_436595_F20405B5 
X-CRM114-Status: UNSURE (   8.88  )
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


On Thu, 06 Mar 2025 20:38:07 +0800, Chukun Pan wrote:
> Changes in v2:
>   Improve commit message
>   Add missing QoS compatible in DT
> 
> Chukun Pan (2):
>   dt-bindings: mfd: syscon: Add rk3528 QoS register compatible
>   arm64: dts: rockchip: Add rk3528 QoS register node
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: mfd: syscon: Add rk3528 QoS register compatible
      commit: 19a634195c1abe498798b564cd6b81e6dd4533f7
[2/2] arm64: dts: rockchip: Add rk3528 QoS register node
      commit: 61a05d8ca3030a544175671f5fab7a8f29c24085

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


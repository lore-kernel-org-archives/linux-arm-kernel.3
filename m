Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75ACBCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 03:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2n8VJ9JC9Kr9SW0ry0R8XNgLg5apb9shtsAnJ8z2Hl4=; b=1jpETL+XPtspDCT+Fd2K8+5jgU
	piuhJh0+0jJJWKbUBX25DDTQRCvhLhBCbFyexdNDF1D+ooWDa6Nb0UYZjRVIECDR+CLt7PqeYOgPV
	RaP+/r+t2ZyS8QLopE8wEcNP5E2xsQQsnmJVJ3rddaHPIjNff1+uPeHiyrb9Vttw1HCoXufHHFnxY
	LAtKfAERO7hXCw0uQ5Hg/8uIJD1q40H4hTvQtNRrt04MMSlTQaaphPOg6Gy08++an8ksLsEzTJ4UQ
	xzbvDCTddPwtTo0q8Tgwzxpl5wOkNV+h3ofijAl+GyYXbKJ3Qp+EzqvPeDbr19xBMQNWGiueI23xD
	vYnLqJmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4A0G-00000009XFB-1d4e;
	Thu, 02 Oct 2025 03:29:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4A0E-00000009XEo-01sD;
	Thu, 02 Oct 2025 03:29:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF08140271;
	Thu,  2 Oct 2025 03:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E777C4CEF9;
	Thu,  2 Oct 2025 03:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759375747;
	bh=BvDPI/4IuPDJZpOnpNE5Q57W9CRHGfyMP9sQtv6gKEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RNNgzr2rdi+C8IDTWCyckUg3LpN7BNsefhA5z81rBhrGppBzA/QwjIGUhZJD1c5Uu
	 N95RMC2emcEtbR+X5tep5Aghvp1hljM6v9+3//KzF3qBklchmTlahhH7jXgUS7LIF+
	 mnYm4MYR8K/PzGibXijcjR1YzeS0gFmujnzyWMdkjyUhegcgXHZx1ji7hol8pv/zCP
	 NVQvMwQLj8+od7LD0PvGRWaTu9pIw+hgygikt+1H9+jnOuh58kinOex3EEmpEYUl8E
	 QNmcqPAh7hID4S4720Uo3PQjQqw5LJyXv16VbbYbT71YEAvOdVJm2rcc2qUbN3Flwf
	 GxYugl0oa5T6g==
Date: Wed, 1 Oct 2025 22:29:06 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-mediatek@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/3] dt-bindings: net: airoha: npu: Add
 AN7583 support
Message-ID: <175937574555.3012205.7371321429695114509.robh@kernel.org>
References: <20250927-airoha-npu-7583-v2-0-e12fac5cce1f@kernel.org>
 <20250927-airoha-npu-7583-v2-1-e12fac5cce1f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250927-airoha-npu-7583-v2-1-e12fac5cce1f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_202910_065473_1379FE15 
X-CRM114-Status: UNSURE (   8.06  )
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


On Sat, 27 Sep 2025 16:03:40 +0200, Lorenzo Bianconi wrote:
> Introduce AN7583 NPU support to Airoha EN7581 NPU device-tree bindings.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



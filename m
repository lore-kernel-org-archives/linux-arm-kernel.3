Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED07E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Le0UuHSRBA2AJMcnuVqrUd0iWe+Xdue4OGdaBK5sSDw=; b=eqXHEcaUHAFoD+nthG5wJSXSWm
	EgTmP8AHxJyAil2hrnsA9iAi4CTKcosto9CKx8uBC9JPV8g6h0I9ZRb513L1Vth+lFHdLKa3L/egn
	K6XZGBfZhJJ/1GppCc2lXzWs+rgreJqopeOPNsmSI2YXyhaxe+mWht2EFD+UalNi3GOypuIaQq0LK
	1nKT/TrxHwa/SBBaQRU3YvKR+nX0Vfo+ltqY8M2TV+KUSN5rNQcVE7embU822qcBQgdRsywpHQe8X
	dl8annOtW6wN2rgNLTvojYWfxglNWtYkaC+3OapsBotsPN/GJoATbUNBwzJyyEyZGLGLmFIkrLk8e
	hL5x94LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVA8v-000000055Ql-1q7u;
	Tue, 07 Jan 2025 14:01:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVA7g-0000000555K-2bcJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 13:59:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DBCC0A4137B;
	Tue,  7 Jan 2025 13:58:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89F39C4CED6;
	Tue,  7 Jan 2025 13:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736258395;
	bh=L7eQrOeAfRkfMKCFDTnOc1QtRjDr4z/HI+RTxASHF2s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Bn+4CxlDXtdfH7ozLweXfLH2CElYBUI2pac4tlNZTDhBRa/Ab+u05JKkZAKvhsuLV
	 sHswtkIXBeI/C1U7qmfbVJsTmX2MKJCJ9n81BOklrWiv8NnUIa50nwpXRbAHRhv0LK
	 /m6fxDkI1F097O/b3+Rt2rqGQs9ZCnaG9jNwbxcUjZ+yZkCynyeZpIpdbo9VKHfTG2
	 xGxhfMAzQtjBAc3J3toFfFnNeu5gqcpSRvaZH0z+imTQfNC6w1UcIVvxjUi38WsqQZ
	 4VRZTtVCKQvcoflSvZVfT61phhrRysliNmNEdRoOZyNx1KlOMlnwW2gI7LlKfpQn82
	 snRyLJTkM2rWQ==
Message-ID: <00bea5d9-4a53-417a-911a-10ceead88b3d@kernel.org>
Date: Tue, 7 Jan 2025 15:59:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am68-sk*: Add bootph-all property
 to necessary nodes to enable Ethernet boot
To: Chintan Vankar <c-vankar@ti.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Tero Kristo <kristo@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Nishanth Menon <nm@ti.com>
Cc: srk@ti.com, s-vadapalli@ti.com, danishanwar@ti.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250106123122.3531845-1-c-vankar@ti.com>
 <20250106123122.3531845-2-c-vankar@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250106123122.3531845-2-c-vankar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_055956_727296_96DFD5E3 
X-CRM114-Status: UNSURE (   5.95  )
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



On 06/01/2025 14:31, Chintan Vankar wrote:
> Ethernet boot requires CPSW nodes to be present starting from R5 SPL
> stage. Add bootph-all property to necessary nodes for CPSW to enable those
> nodes during SPL stage along with later boot stages for AM68-SK.
> 
> Signed-off-by: Chintan Vankar <c-vankar@ti.com>

Reviewed-by: Roger Quadros <rogerq@@kernel.org>

-- 
cheers,
-roger



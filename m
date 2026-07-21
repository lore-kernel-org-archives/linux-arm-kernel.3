Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558CFC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 09:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MARtTml5o7wpQs6XX4WHkU1C1Cpv+EWmxKbVJQHx+mo=; b=3EHhs8o5lMM/GzMUWYlheIFza3
	lJ1tSHFXKVrPuJLecK/QE6bYsNIqHTJ5hzSxPU35tC9+uYuH/Hvu2ZE3G4XCLbyW7Fe+xQekWO71s
	uJe6SUg2SNz8mPQM/tOsH+kyJt/sssqfxUqBZONZCBzfcuEBclmvXk2bDS8vN8JPIXuLVKNE9tIVZ
	RHcUnULXdk7EuWA0Rf7yMBBYwd4mznms5Qud251o4M/bApGCv5ZhbaXhco24CNpzvOIdeDl+oEaia
	GNt3LVB2uHap021I59seum11Gw0nlZFUUCVIno1PvpA/Qhxe2AkA7nVD44ALMI1DXEgJhHa7DN3R2
	PPwjtvqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6dk-00000008xUB-0gSL;
	Tue, 21 Jul 2026 09:19:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6di-00000008xTO-0w5a;
	Tue, 21 Jul 2026 09:19:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784625588;
	bh=VNm4zMuC/cY2KdIr3jVDAGU5TNHGIenW9B8Its2FuNw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HBIolR8JvWb6/Pg9E/k0p6NmwVt4W57w+dwxP8WhbTecU2uYVcgMLkwJhmveXmed2
	 VKJPxf/hzgVpc6ifJwzWFzvlego4Nk2vYCLKizimaQqrDRInyvVftbLBEdv8D6rgaH
	 VeYTT253ziuTzQid8JlO/8zcgmVA496jna947vjcsBmjAPuO2ji8326cnbvuHpqR0B
	 UNf2Y/PW2Qy7no4m7tnImWnNsOfEWYAaiIgqpdwvi/1ytCp5l0Du6IZ7s0rn0jv/ym
	 +xn5Q+d62IVtKv7xGGLzo8UiiUw1o/EVvrVIt7MGDh1LG+sZfEbf1md8C9keGhYb8v
	 uvYruRQkAUTTA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C11A117E0564;
	Tue, 21 Jul 2026 11:19:47 +0200 (CEST)
Message-ID: <cc9ffb02-4175-48c2-89d6-b538bf75a350@collabora.com>
Date: Tue, 21 Jul 2026 11:19:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] pmdomain: mediatek: Add support for secure modem
 power domain control
To: nikolai.burov@jolla.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ulf Hansson <ulfh@kernel.org>
Cc: Matthias Brugger <mbrugger@suse.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
 Nikolai Burov <nikolai.burov+review@abscue.de>
References: <20260720-mt6858-pmdomain-v3-0-8966d8de93c8@jolla.com>
 <20260720-mt6858-pmdomain-v3-2-8966d8de93c8@jolla.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260720-mt6858-pmdomain-v3-2-8966d8de93c8@jolla.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_021950_428979_114EA2F8 
X-CRM114-Status: GOOD (  11.96  )
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

On 7/20/26 22:46, Nikolai Burov via B4 Relay wrote:
> From: Nikolai Burov <nikolai.burov@jolla.com>
> 
> On recent MediaTek SoCs such as MT6858, the kernel is required to use
> a secure monitor call (SMC) to enable or disable the modem power domain.
> The power domain control register can be read, but firmware prevents it
> from being modified directly. Some other parts of the power sequence,
> such as setting the ext_buck_iso register, still need to be performed on
> the kernel side.
> 
> In preparation for modem support, add a flag to enable this new power
> sequence for SoCs that need it. Power domains using this flag are not
> expected to configure any bus protection registers, since these are
> handled internally by the SMC call.
> 
> Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


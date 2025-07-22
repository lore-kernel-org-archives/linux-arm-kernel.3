Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB137C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 11:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uls65zjLvZyRFmNl+e//+9lL/rdLsnl/vKqyeLnk+9Y=; b=X2Vqsqpoglqq4YCFUSpX/Wcb3O
	T2Tefqh2wAm2LvNmQiNBfZq7TfZyjhkf3ALdEy+aDxMoBktdpbKbmZCcxkWl4KwdhUdCKyneP1KXN
	f3/VzSRIZluVoA9/vBUl3fsgSeBNXV9ervaklzew31S/O9X6MLHDXq8i5n52XKLmPUg37g8I7d5Oy
	gMLOVWAH3rhdd5CwS/9y9KRoICi21sSA6AuDq/Ze0FpizyYaWOlp041jz0v9i3elNX9XFYg3Z7FgB
	QT2HTCdcCeQPpRIE8XeLcB0i+0/nc9oJLFK2KfgcKLVqrYxGb37moZRKat4Upu6F3OT4MgtEBhpXL
	fP6lmr/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueAjj-00000002DJx-2G9p;
	Tue, 22 Jul 2025 11:00:43 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueAO4-00000002B49-1XBC;
	Tue, 22 Jul 2025 10:38:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753180698;
	bh=bkY2GEXAbZCEgimSdKFm2IARS0ffaAm1hymKFyKVnv0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eXdbux7QGObp+HZOOdFAxjOZIbimZVtKUGpGttgN9rUum33zjv7HhTR3SrOKrEJdi
	 2DtVVJqbiPby5tbabC6G6tSXm49COXRayntenGTka9I05bOYpYLKwyowdvpVqeC/T4
	 a5QWU2DOjmMPRGcdWi6e4eEyMhcjVLwKrwGYpMXs0W/rBHeNhImne8tCTdALWPExtX
	 0/VrL/Cg24AdWQ8LOZotmViIrpd+bTCF/U705jqr4NM5p9r6ZYaAmnqjFWTiPi21fX
	 nseJPXOlNyRwyo79RS6rdTSxGO138uwH58XH/W/m0AfQmAl2YptMjpXf0174UX+iGy
	 wPtOhZacXN/Wg==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:bd9c:eae9:88b0:783c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 22DF017E0B72;
	Tue, 22 Jul 2025 12:38:17 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: angelogioacchino.delregno@collabora.com
Cc: andrew-ct.chen@mediatek.com,
	arnd@arndb.de,
	bchihi@baylibre.com,
	colin.i.king@gmail.com,
	conor+dt@kernel.org,
	daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	frank-w@public-files.de,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	lala.lin@mediatek.com,
	laura.nao@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org,
	lukasz.luba@arm.com,
	matthias.bgg@gmail.com,
	nfraprado@collabora.com,
	rafael@kernel.org,
	robh@kernel.org,
	rui.zhang@intel.com,
	srini@kernel.org,
	u.kleine-koenig@baylibre.com
Subject: Re: [PATCH 9/9] dt-bindings: nvmem: mediatek: efuse: Add support for MT8196
Date: Tue, 22 Jul 2025 12:37:18 +0200
Message-Id: <20250722103718.31804-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <24c65ecf-ab89-4970-b2ae-00185259d359@collabora.com>
References: <24c65ecf-ab89-4970-b2ae-00185259d359@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_033820_584110_CF9982AC 
X-CRM114-Status: GOOD (  15.27  )
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

On 7/22/25 11:04, AngeloGioacchino Del Regno wrote:
> Il 21/07/25 10:14, Laura Nao ha scritto:
>> Add compatible for MT8196 SoC.
>>
>
> This is compatible with MT8186's layout - not with the others - and
> besides: "mediatek,efuse" is deprecated.
>
> Adding something to deprecated bindings is not even really permitted (unless
> there's a *very* good reason to, which you definitely don't have in this case).
>
> Also, this commit has no description - repeating the same as the title adds
> no information and doesn't help at all.
>
> NACK.
>

Got it, thanks both for the feedback - I'll fix this in the next 
revision.

Best,

Laura

> Regards,
> Angelo
>
>> Signed-off-by: Laura Nao <laura.nao@collabora.com>
>> ---
>>   Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
>> index 32b8c1eb4e80..e209a1132a26 100644
>> --- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
>> +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
>> @@ -37,6 +37,7 @@ properties:
>>                 - mediatek,mt8188-efuse
>>                 - mediatek,mt8192-efuse
>>                 - mediatek,mt8195-efuse
>> +              - mediatek,mt8196-efuse
>>                 - mediatek,mt8516-efuse
>>             - const: mediatek,efuse
>>         - const: mediatek,mt8173-efuse 
>
>
>



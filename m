Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F329C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 10:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zk14oY7Azme+0tnLvcrF3Z1tvIjv6S4Vu59YuCpxu5E=; b=2x3Vq/TIztaiCbV+fcPawsmU0u
	Yj5PRQkR0lsPE6U+twtXSVWPh1FpUXc+/+wxL/sWTCkWV2p71us35L4Gn/Eo0Zq3xnyqx0oGdrppy
	48iM+1Y9zUJ8V8D/s7aRfBdLniyedYz6kie4mb4jy7Q8D0zxQcdywUubZu7JM6FasV/8766zSZ2v7
	SE5prbCP/8i30ZsW1iMffNjewkWQDPMhoqcEc8QCbqaXNKNLJEFMHHVN8TUkvuVoXAU5nHzxsmA3O
	+J4QkJefmXVUj7p3u+tgl02w4Hj4hKyjhmyATNzMS06wdBQ89z2+3LVQMNzljZpfLzC2p4ytjDWws
	S/ASQoEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhQdz-00000003O4X-1hf7;
	Thu, 31 Jul 2025 10:36:15 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhQVu-00000003MoJ-0IOt;
	Thu, 31 Jul 2025 10:27:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753957672;
	bh=dnZjKRCbKVsKnQZ0apVq2Lv4BunDXwUPUKqAx1JmXY0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ATmu3VSXbzmFgfERV8e6Eu09Yb59Km6Ykr6zjqidJhxo8lYfAjorCqIYjaanz1Xc0
	 SDTTZwne3FbduuRoAV8Y/xwDpdV6BK5JzzkqzlEW7Ie6hljRkQu6DKHGiCSBo1nkUm
	 BIWUana48yyrDcO3OgtfYzQOUIGzQZJqmqDVJDHN462wFB1GT1rsPysz/22CzIhtLB
	 YvgID2t64hFdwfPzDT6p1PyUv4JrsZburd1XaKV3dCjkJS1V8UrZ2Mx26uKLFiVC8q
	 uHeVH839HFlFeTHR87ZH9CwNcNUu7fQKhOIoWTLOhyOaxCpSdpICjfqJF+T1r8cTQt
	 cL2PGkX+pmnog==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:e229:d0be:3141:7dd2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 82F5617E0A49;
	Thu, 31 Jul 2025 12:27:47 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: robh@kernel.org
Cc: andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com,
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
	rui.zhang@intel.com,
	srini@kernel.org,
	u.kleine-koenig@baylibre.com,
	wenst@chromium.org
Subject: Re: [PATCH v2 9/9] dt-bindings: nvmem: mediatek: efuse: Add support for MT8196
Date: Thu, 31 Jul 2025 12:26:50 +0200
Message-Id: <20250731102650.145641-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250730235451.GA1911689-robh@kernel.org>
References: <20250730235451.GA1911689-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_032754_260531_A3124653 
X-CRM114-Status: GOOD (  15.15  )
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

Hi Rob,

On 7/31/25 01:54, Rob Herring wrote:
> On Wed, Jul 30, 2025 at 05:21:28PM +0200, Laura Nao wrote:
>> The MT8196 eFuse layout is compatible with MT8186 and shares the same
>> decoding scheme for the gpu-speedbin cell.
>>
>> Signed-off-by: Laura Nao <laura.nao@collabora.com>
>> ---
>>  Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
>> index 4dc0d42df3e6..455b96c1e1f4 100644
>> --- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
>> +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
>> @@ -25,6 +25,7 @@ properties:
>>    compatible:
>>      oneOf:
>>        - items:
>> +          - const: mediatek,mt8196-efuse
>>            - const: mediatek,mt8188-efuse
>>            - const: mediatek,mt8186-efuse
>
> You just broke mt8188 as it had 2 entries and now has 3. I think 
> (based on the commit msg) you want to change 8188 entry to an enum with 
> mediatek,mt8196-efuse and mediatek,mt8188-efuse.
>

You're absolutely right, not sure how I missed that.
It should be:

  compatible:
    oneOf:
      - items:
          - enum:
              - mediatek,mt8196-efuse
              - mediatek,mt8188-efuse
          - const: mediatek,mt8186-efuse
      - const: mediatek,mt8186-efuse
[...]

I'll address it in v3.

Thanks!

Laura

>>        - const: mediatek,mt8186-efuse
>> -- 
>> 2.39.5
>>



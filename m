Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBB8C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 10:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jfbWZsVYKGd2vhb59LMvooB+7pVsSumkwZmP9TEYRaA=; b=I4ncLZEqpzODtqzfBRFKjqdQ35
	UlX7EYaV2PD6CspnffT1gGY9/gkxMFbefSX6JQ1InlifUI9J2kJbX9LrvRKBdONK7Qvo4d7mLH5v/
	x7tM1b3bud/E5w0hs7dU39jA4KIRl2TK2tvzv90u7stkEFGtD2CstoCgei3O7SZMFGnrWPdUdN0D1
	MbJ9OCM4vf69ylgJpqUFaqO43SjgMcb51t4qye0DrghRuZnBEBhCyLHwEb7Hut+9bf35feqdKKrtM
	XQGzLqvxh9JrncSkgVBf6tWeucb24HtQQsi0JgtXr9RokFPkxFv0lTBQuTN8z2MRRaXVChtq5up73
	9k9rk8Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeDI-00000002Jap-3SaY;
	Mon, 23 Jun 2025 10:15:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdWW-00000002BLf-2L5T;
	Mon, 23 Jun 2025 09:31:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jfbWZsVYKGd2vhb59LMvooB+7pVsSumkwZmP9TEYRaA=; b=bBnsiQg3bqVs1Cy0Rwd8xw+SQq
	I+dLyVaW82AMmUeA9q0KVqnA2TD5pj1PBQG9zk9PJlF2sgRMZJsBEwrITX7a13GzbqWFqwiii6G0j
	levoMjGiVyCeXwIceJmHD6RNonGLEvdby0v81lypGoOxH7CWlprdlmw1T/lCnLeRLwrJsDJeULim0
	DGgoQzOKHFNv1nq1l+oUBwZXCV6Q/AnS3aREpIBMqFStAe/1AXAc1RZ+6AQ8Zq1XfdZrihv1JlxKE
	O32W6WrAFFDngZAXgaimhBMGR9txJwY1nV4Bywu4JBP0pw/tlDNacdr041dirkfDzgj6MKP4qtfJc
	qcCRpiEQ==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdWT-00000005AaG-3oX8;
	Mon, 23 Jun 2025 09:31:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750671088;
	bh=JaT2s8sZCiv76xiTzrJooBxZJYaZSavMoRgZIB0v8Mw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V8bbwTY9p4Qb0yiujQohkXGHiM8iQRUGkFFJ9UUyQtYLEU3HGjM1ZSmTb/N3Dysn5
	 Zxk8e8CXXsX2AYWNi7dB59K3eiPQj8ln4KPD9pYmRV3wpSriIJvSJ6thH2erf1QSw9
	 2Ki7ciAd8Y/fCc7yvLVFktNpegGnpBhzvPLwV62PLY6PNJv4fgjnGxF068GzpQVUC+
	 R40CN5Poejkjfv2xrMlEMxS6gBjqItwX5OekjaTu6XQUIwzJ7uaSm+THljd9S2HbGN
	 pyekTCUxXJ9dSFoLoiXlG8lBh4ylv1xqlqqjNhdDTnGnfV87+WaaxEOKYnsYMyi6oc
	 Sw03x2XUuTRJA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 19FF117E05BD;
	Mon, 23 Jun 2025 11:31:27 +0200 (CEST)
Message-ID: <a2e006c6-89d8-4997-a759-a461bcf891ea@collabora.com>
Date: Mon, 23 Jun 2025 11:31:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/13] arm64: dts: mediatek: mt7988a-bpi-r4: add sfp
 cages and link to gmac
To: Frank Wunderlich <linux@fw-web.de>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Georgi Djakov <djakov@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Jia-Wei Chang <jia-wei.chang@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Daniel Golle <daniel@makrotopia.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250620083555.6886-1-linux@fw-web.de>
 <20250620083555.6886-13-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250620083555.6886-13-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_103130_150925_D1F15A8C 
X-CRM114-Status: UNSURE (   8.23  )
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

Il 20/06/25 10:35, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add SFP cages to Bananapi-R4 board. The 2.5g phy variant only contains the
> wan-SFP, so add this to common dtsi and the lan-sfp only to the dual-SFP
> variant.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




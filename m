Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E80FC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 11:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y+Xd+6aGr+ZXiU1RvyyhaJ3idHNByA0KK4xiXzkpDHU=; b=s4BadJRi2ZTMKA3ipqd7ZbRLSF
	5uoLYOAtYuhlf5DeUc+uD0gtKemh+Fw50DqeZkq6Y22+AWh6Xa06AlvCrR4RTZQ9WXeGNxsx+6Gnu
	5fecnv4dp4Kvxg9LgZDvc9gSta1SR9oF7D8o4I5JdYoIpbctNEQdXGXITsmzt0VHm3XzmDulJAfgk
	SLgZZmmyPknYoAVrBw/+273Gq76u7wFX5shQQ7X7ZQwwrN1b/u4+zyjSHF8idAT+eh4OtjqQEsMG8
	3mKQYDnFXkWmRukEkc8eyWimc1h2/wF3VxtDeWjxzzjWAgplOvmzU6dsZddUU/CRbSrhw9cQTJNHU
	dcjkvFhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yw4-00000005E6W-1oWR;
	Tue, 22 Sep 2026 11:45:20 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yvo-00000005DsG-3b6e;
	Tue, 22 Sep 2026 11:45:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077502;
	bh=9ym6rEkISlhZpjeDkIyicq4VaHCk1N/tOnz9SpTaAxg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A4RXztdq65Sqs/zkCx3FYARWH1KAbN9GtnTSJRLqBfNjLbzODuR2Fe4n9oxJ//ORp
	 WPffBufcJJOfwNUUQggz5LMX+v+pfRXrfVb0e//PTG9IRWTNgWaNudIhCmn1TUVFs7
	 kT6v3DPwev2tGejI3d2vEz+NcZ52Qlim2FOF5M3b9chFVIxW7MEQjMwha5MQO3tW+0
	 HhgLJ2gpSXJ8Ao5BrlDdjoQdx0HTubpSoEv81eCMaq1YlfjvChpF+Hi/4W3LtTLX2H
	 T1FBlvQz9BVVR0hCox41+baCwtfc/+CBG7eua1xt+b/u/Xv5lgFZZtwqrU6Zx/y5Ix
	 rfwdVxGe4OEDQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4AF5717E0515;
	Tue, 22 Sep 2026 13:45:02 +0200 (CEST)
Message-ID: <9ff18cec-ab98-4197-ad70-1d0fd56c4e6c@collabora.com>
Date: Tue, 22 Sep 2026 13:45:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: soc: mediatek: Allow pwrap regs
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260921232527.3127894-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260921232527.3127894-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_044505_064329_7EDD4CE1 
X-CRM114-Status: UNSURE (   6.49  )
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

On 9/22/26 01:25, Rob Herring (Arm) wrote:
> The MT7622 PMIC wrapper has a regulators child node. Add the child
> schema reference so regulator subnodes are evaluated by the MT6380
> regulator binding instead of being rejected.
> 
> Assisted-by: Codex:gpt-5-5
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



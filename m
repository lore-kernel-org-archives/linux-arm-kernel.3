Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38199CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7bAFZdHZy20KzMfcCtYiA2keQeqljS9wozxT9bnoEak=; b=VHJjBCLHEON2hw3DyN0Q/3tIC1
	h2rzdBPOsVY49UReG41Jbfgl698Pq1xXorOb0uPUk8stngx4DJggsfT2tUwrSZy7anzutUT7Aa3vM
	vFQpBA86OPFYGAk+3/Qu2AGMbqrrBJD2Ok4m2eR/DM6tPbeLfrbJz3FOVl0Uq9+wi//LQtntHV54K
	K2DKAvZafYYIBy778zeAMMEeySeaSwb9IyUdGg0tAgVKzAXjTTaesROlHY579FBawYsfB92FV4rk0
	HG7QKwTTsUoqOQdluLumWT1OsfTkWh2CM5kJl33eBTvye31FdutUqgOxqmBE22SX6f3mQH3DbXta4
	zBM7gwYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnSS-0000000Cw1f-0nl3;
	Mon, 20 Oct 2025 10:49:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnSP-0000000CvxC-0ZbS;
	Mon, 20 Oct 2025 10:49:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760957378;
	bh=4q7bStPX7BqVDGCLC1PViWLocjPoO+px7Wi9b1Kj/T4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gBvRol7Rqry/KkHOfomZ5bphkYi7XMyIjNbgPMPmBLhcTqpvJFSW8Z/+mhrT5yTI4
	 wFvFzPwK27f+wiEbk8VSn37Trs1zu0j2BkmztH35tqO+Fsb3z2kWAAEXbt5FaxEEOo
	 W4xqME1YAwkX9+G5Wep5fPsyUnlnMNGxa9Xr7Ejt7ekFH0ugluIucTcTll5IUWrwC3
	 JBIJJ+hrJDsdzV5muyDrASImeJgUOFd9ENPaTnHNz1ChitJBbQNow4RshEx8Tv18MV
	 lavAccJsT1E90RwWATPgFR1NHRve2hzrb8H6FYv4Yqmo6pJHcHmx3nIC/6bTy2ZRXm
	 lhZ3vZKoxEdmA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 93B1317E0FAD;
	Mon, 20 Oct 2025 12:49:37 +0200 (CEST)
Message-ID: <0cb6a85a-1fdd-4ac7-aba7-bb25945b21f9@collabora.com>
Date: Mon, 20 Oct 2025 12:49:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/13] dt-bindings: arm: mediatek: mmsys: add
 compatible for MT8189
To: Xiandong Wang <xiandong.wang@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, jh.hsu@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20251020074211.8942-1-xiandong.wang@mediatek.com>
 <20251020074211.8942-7-xiandong.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251020074211.8942-7-xiandong.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_034941_577059_DE1C9E05 
X-CRM114-Status: UNSURE (   5.75  )
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

Il 20/10/25 09:40, Xiandong Wang ha scritto:
> In MT8189, a single HW pipeline was an independent mmsys,
> which included the OVL module, PQ module, and display interface
> module.
> 
> Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




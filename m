Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A10AC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 09:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=72dwtb89d1fOsKbk8D3RVbFWmgvO0+t1Akc8xh8LysM=; b=o+XQms/QJ8occdSb3XCPxv+bMA
	OoSpvrvJfHjzigx8n7zFHKAfYPbcGAkWrBpBYtubPPGMiR36tkZFP9JBP68QwbV8Nlqr0af9VB8CY
	G7QlqyJPjfRkVUmEYLUs9AWV/Wj961QJHawPOn8KMVl44IvQ/l49YBjaZ+QFlyDJ2kVtfawIU8ZCh
	XpD5X1b+jA985mwl4NSiOTcGjvkxOMy0rqjwN7FbBacD9j40HQdkXC70KOu4gIN9Nhn1qjCDAJggJ
	rsqOu2vZtcv46P+zWPeTBams/FQ/DbZehK9DhkBFoXiE+skOxiZBUe+/vpxonR15w7WFGCuvQqt7E
	VG8kOz2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Jc2-00000007nmU-1WlJ;
	Wed, 23 Sep 2026 09:50:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Jbt-00000007nin-2lqm;
	Wed, 23 Sep 2026 09:49:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=72dwtb89d1fOsKbk8D3RVbFWmgvO0+t1Akc8xh8LysM=; b=bbT/Zjj7WGLliyOfiX7d+SF+am
	5akzy9bLN40SOZvgvs2zC3n5ola2Tddf/sn4U4Aj5VazGmhrt7kLdblSU3JTUCHlSuX91VZA1TKOF
	3IfNL/gwUiuswLsCQe/qhRItBMa+pHEQqbw+pg/VOr2zAWS8+YsXlQLMT2B8/+BagTMdq3DhGM0z0
	jcw+p8yx8nx4UpKF327s/LMU/bomigm7u5F5GpkzdyqCEiPHhqyYyJxeS1K4JWUVUpkR8vD6pgO0N
	WKaiegA60qHRNE0rXHJ6DAxlqQ96m9/LGHDM6mO6kvLRwd+EcAKDlhrptfV/FbYphXkks5WH/oSMx
	/y/+5vkw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Jbp-0000000Ebma-2NPN;
	Wed, 23 Sep 2026 09:49:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790156987;
	bh=ZllYfIqMj5QwbDcYFikdii50JKHrD69B4mvu4oa3wTo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IK4n4bXJOOQ+sysykbv7gYumDmA7LQlGFjhUNXn6BP4KhBFIb1ZF1FslH9MzbNF6N
	 ezQS4sDTXwLW+pb3JUIocSoTkzrtCtYonylmhul2oq1q4AwuWbUfUrI+WP/sgupZbi
	 IgP49JG45XwreBReCHCNx0lKx1sgPiCIJjrQOlKLdaVgnYmOHV0zIKti/PIUyr5eU0
	 UZMaHqrZ/62AeFJxg9SNGS6U4kLWl8x/ehub2803RZSU3o0ieHIqk18k0+qX0fRrm8
	 WgXfzXA0kxxPm9v4MfvarvhfHTDlyaMDf4PxmIzhxx7bBoft4EqNALmRHn50KBak0y
	 5VhQOBEtfCX4g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D8A8517E09ED;
	Wed, 23 Sep 2026 11:49:46 +0200 (CEST)
Message-ID: <78abee33-9ef9-4fed-9968-eb2010068f6c@collabora.com>
Date: Wed, 23 Sep 2026 11:49:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 03/10] media: mediatek: decoder: Move firmware
 selection to platform data
To: Kyrie Wu <kyrie.wu@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Yilong Zhou <yilong.zhou@mediatek.com>
References: <20260923081246.268182-1-kyrie.wu@mediatek.com>
 <20260923081246.268182-4-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260923081246.268182-4-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_104950_144241_B24091F3 
X-CRM114-Status: UNSURE (   8.95  )
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

On 9/23/26 10:12, Kyrie Wu wrote:
> The decoder currently selects its firmware backend by testing optional
> mediatek,vpu, mediatek,scp, and mediatek,vcp properties in the device
> tree.  The firmware backend is, however, fixed by the decoder compatible.
> 
> Add the firmware type and initialization callback to the decoder platform
> data, initialize them for each supported SoC, and use the callback from
> the platform data at probe time.  This matches the existing encoder
> platform-data design and removes the DT-property dependency.
> 
> Fixes: bf1d556ad4e0 ("media: mtk-vcodec: abstract firmware interface")
> Fixes: c7244811b1c9 ("media: mtk-vcodec: add SCP firmware ops")
> Fixes: c3da5e939cbc ("media: mediatek: vcodec: support vcp architecture")
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


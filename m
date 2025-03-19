Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2272BC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 09:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cC76YCfiSNMqsCxJUxggfCRLhGjIFb4HKrcJgwhxaII=; b=exScjBqC2FCf6Kx/2pEniA+fd6
	/Jh+H6QfLVtmlQWCZHJE96EpbJDslKpe0/iC99ZzBLMWFZLc2DEMiP8Oy6DPvL8wB0JWYmAApngIu
	6kvwU+vLd9Hlefxvg+ohMhtdO4H7VT7MH/A564ZhymFlLn9jKFjdlyA8u1OifKvKDj73xz58+hOzR
	MkB2Je5sEPs9MOCW9DaXMdIGu7Nmx3WaulzjJluYjdTs6q0EAsDruT3RDXtV+8evJpZVeNVCVf5fJ
	krpNGzHZsCRX5zgHJfA//XhTdMOaWiGovJ2oLTma3Dvyzxb09PlQsNtio3x6FsC/haSGGVqj5argz
	Q9fDJshg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tupys-00000008Xs0-0ILO;
	Wed, 19 Mar 2025 09:44:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuppE-00000008VRW-1RDK;
	Wed, 19 Mar 2025 09:35:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742376898;
	bh=hlR1b92BGhraEdJ/3hiWtZX7ocppxEHtjil//YlkdMk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AS2Iww3d1F9jQhFkhUT9fyMjL5OAkGF/SF4kKJXETEPHnGmAHNAijXMxXXpZrhsBC
	 XTOQhExk8vXABOLCpVJZjcqnFnsce/WjhkwQyLmi0WxXPPneE9YXOgn0zKNjBUmrfq
	 NcM/lJpfpCZdpuXZtxd1xYitOoPghuTf0uZk6nXjHuIjQORpz+W57lkGQgwDbz1ju6
	 PJQ8XdfLseNd8JRtebwup/DJ+Wbb4mrINtF18oJ3iz99XLulSNfXbxoIo5V5flC4Px
	 CggIZG1vh9c1DTcEAUHNKh834OQqcCBFst6ZnQ8uzI04l2yHrx9c8FrEN3WWYKNjBq
	 3EavTVERywcBQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 539DA17E0673;
	Wed, 19 Mar 2025 10:34:57 +0100 (CET)
Message-ID: <5bbf7b0d-245b-4f1d-a712-1d81709e35d2@collabora.com>
Date: Wed, 19 Mar 2025 10:34:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: mediatek: mt8390-genio-common: Add
 firmware-name for scp0
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Olivia Wen <olivia.wen@mediatek.com>
Cc: kernel@collabora.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250318-scp-dual-core-mt8390-v1-0-8733e192cc73@collabora.com>
 <20250318-scp-dual-core-mt8390-v1-4-8733e192cc73@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250318-scp-dual-core-mt8390-v1-4-8733e192cc73@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_023500_553165_1C955916 
X-CRM114-Status: UNSURE (   7.23  )
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

Il 18/03/25 23:22, Nícolas F. R. A. Prado ha scritto:
> Add the firmware-name property for SCP core0 so the firmware can be
> loaded from its canonical location in the linux-firmware repository.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




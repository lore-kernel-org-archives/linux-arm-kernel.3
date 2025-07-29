Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A1AC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 10:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMEe3XZpHPxwwnaqtq+9kNL/ex5JhOTcLJrsDcwD9OY=; b=ryBzkM0tnl9l/iYN5ag1mqxErg
	vbT1hw8Hp3O3Aeb8we/GwPEFBTX4iSyfFEZFoJ+V4Zr0QnNKhnv1kZhDhqV1nmWglRXkdIzNIzuf9
	ttbeHBIc+p1sR0XTjoX0slAgfPE1rhejN2cUk8UjsW26MPdOTAwQOBbj8iJ4LkeY6Ek+DNmvxvWf7
	LIZUD5MIkw8o7b3Pj6qbW2l+HIh3g+ZxrE8MiyRdMB/g7RgGdDz9GiR+bhITklSJoiR5JWpqSI4AV
	Kh45zObvGXbuklsBL5YFdqLVlwydIPxXerJShx2HLnzipNWMoXsCSR0/s+E/hgW6ZC8fvFWZJwMmT
	FuQPlENg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ughMP-0000000GV0D-0amq;
	Tue, 29 Jul 2025 10:15:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ughJu-0000000GUgp-0gQf;
	Tue, 29 Jul 2025 10:12:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753783948;
	bh=ga1JTtLUG7Q52MGzj+vkuRjsmvah356T2zKFS+YsXcE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N/5cyCKubm8JTRiz0NaERogxpC26wBdILD44OYbuR3AyAWI2d4V2tKksMFHzjPQaY
	 KXedWyGg99EDOZADwvUFIH+00PqZfJAhxSVmF5t35hBFA0w6HaslbJtfhKLd58Ihzc
	 jdo59aEPgerez2WgwWAoKe1NF2qZlg9qwiCXwAoWiuE1rFWllIgYZ84jVcpGTQRkQ7
	 0PEjqS64qpCOiWM+iQfC48TTL5dMgBTjocbslKIYcCBkz/V4Cmunwo76FDYje2/cQX
	 rp812m3xIHZwy+4362adXy4sNGQKSpJqSG5peTqfIotZ1kIE73c6usUW9aEz5H7niS
	 N+Cf+coo7+e8A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 380AF17E1284;
	Tue, 29 Jul 2025 12:12:27 +0200 (CEST)
Message-ID: <8fbe2710-df2a-463d-a6d0-3e3c1a2ba465@collabora.com>
Date: Tue, 29 Jul 2025 12:12:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: defconfig: Enable UFS support for MediaTek
 Genio 1200 EVK UFS board
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Ramax Lo <ramax.lo@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20250729093506.273337-1-macpaul.lin@mediatek.com>
 <20250729093506.273337-4-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250729093506.273337-4-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_031230_351883_C562B697 
X-CRM114-Status: UNSURE (   7.63  )
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

Il 29/07/25 11:35, Macpaul Lin ha scritto:
> Enable the UFS related settings to support Genio 1200 EVK UFS board.
> This board uses UFS as the boot device and also the main storage.
> This includes support for:
>   - CONFIG_SCSI_UFS_MEDIATEK
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



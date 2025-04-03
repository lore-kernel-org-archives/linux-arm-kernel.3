Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E677CC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 10:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=usim2A8hMRA6lqeD4tO5XX/pZkDTM4BrExVSNhZFgo4=; b=gH0Jf2aLFTfthIUoYru2aYWofl
	NvmSBF6EgsN5ab4P7jUTk+meZjJutAZ9pCc48flBOYio1/NU3i7+zqvL7SisIQwE9hK1m4chdunCY
	73N94wVga2S9NTdBRZiksImdJggenJh1g+Xx6kmwR3+IQEp/Tr5Xz7b5vXqftRhDE4JSCEcRBxDUG
	ZjJ8NgtkqTchMqmLa3/r1aY5Tzmehh/LnwfY6hUkW8M1YTY6oaFeZ16JY8m9+pFHW7MTkQlUzWbku
	Ly+H76rUQsd2a3lcPgTrete8dQKOEZVpmJVRxsuHVjy0qHj+1eZaKh7jj8doBVTq/Oltpzspj+dly
	hyjaqURg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HuQ-00000008aJx-0mmW;
	Thu, 03 Apr 2025 10:34:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Hae-00000008WmG-3tSc;
	Thu, 03 Apr 2025 10:14:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743675266;
	bh=0vZozkhE7JZLo5OJeXpoE83upBP93297ZDa4MSzYioY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QqAsPzQYfosQj2O3c+LIo9G2MhZHo+IgFBteFzHENE/j02rRK8wbCwUjyF0vnWdNG
	 x6DjksuG6a5sz/WdKW48uXCtKkuRXs50TzCIveCnp33QvRwG6Rf9ohp3J6nFERv5BJ
	 XUL89UUPaAcqgwKu5nEP70C7rmFjJuZpknkVIm7t13lDdaFplj6dOJY4rW3wTWprQH
	 vZNZn5G2ZNK6H+zB9QUOj98LOPkJgIkZUV1qtoMzt45ZvzOPE5ZqoBUWrz6P10F65u
	 5Xo4jtan+lD7l7pfKKf7ckcWCME6+vdJs28cm9DEplx3Ip9XH9sxuKlmkuX5OIUvk1
	 M+Va44y9Am2Mw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4088517E0865;
	Thu,  3 Apr 2025 12:14:26 +0200 (CEST)
Message-ID: <c5eef09f-5344-478b-87ed-05f6d8478dea@collabora.com>
Date: Thu, 3 Apr 2025 12:14:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: memory-controllers: Add MediaTek DRAM
 controller interface
To: Crystal Guo <crystal.guo@mediatek.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250403065030.22761-1-crystal.guo@mediatek.com>
 <20250403065030.22761-2-crystal.guo@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250403065030.22761-2-crystal.guo@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_031429_141481_4CFAF296 
X-CRM114-Status: UNSURE (   5.21  )
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

Il 03/04/25 08:48, Crystal Guo ha scritto:
> A MediaTek DRAM controller interface to provide the current DDR
> data rate.
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




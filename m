Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3AAD116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 21:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uolVDxZ9uNM6iJV67STmTU/q18EXFVQS2j96RNuR9Ic=; b=uFIv4PXqM2NFvaf58UrEVBpYvV
	1NYhTeFOzf5qOdYwExH80uNXjr/wccV2zRV2KbSpfnoyOsx7GImEzK+YZxtoYUcP+kn+b0650RTcR
	ZZiHqAx9PzeqfYZzKUknQX2AZd1fQhencj7Iwf2mV/1tKL6q7IsmYBsVWgmItPNtOILCBnLN3ZEyz
	qefBpm/5c8kJksRxBmtAv4w8Hnh3VdWlTiT0uNp6pvB1DijFJt7Q0BjXCG5BwQPE7FkrfAnOACyds
	ZE30fpAIjclqmyaDj3rY7nfq/LcXJ8toVwFf47a9e4wZj4o3rGehn2DuyvIo06KgG9G5ptXyyA/01
	iyQYeRNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP65w-00000000yRy-3zKA;
	Fri, 28 Nov 2025 21:33:36 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP65u-00000000yNi-1kFE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 21:33:35 +0000
DKIM-Signature: a=rsa-sha256; bh=uolVDxZ9uNM6iJV67STmTU/q18EXFVQS2j96RNuR9Ic=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1764365527; v=1; x=1764797527;
 b=pOop7/G5LS5cpY5MSUX3qUDcOdPAycyzEdsXPPf7x67JCzZLV9ldpc0iMIFFEbLdlLoE4tbf
 eYmISdewALW/Cg7aNWmuKFSBAtLPeiGOwr+8JbnzHdwPUbElB5oLclYWGI+ZBhsE2lvS5vD95z4
 jfubpV2hCn2i327e2eQBm0qUW/KwPvK8GchqBmAi/AH2XZHLEyyziVSgB2iqYKLUzXUw8EPxbe3
 vJ14vBu4qVI1WbQoDgBTfuerEzkUrB5xvJtfuaikbeQAGFUJ+vJ39zlK30Z3dsI9O3+1eq9xBOI
 KbSksq5HOZi7ftCZipw+U9UjrbiEoOKQSOLeEGK0BHH6g==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 0e1da1da; Fri, 28 Nov 2025 22:32:07 +0100
Message-ID: <8167f52b-0a2a-4f7f-8fc3-30673f7197b3@dujemihanovic.xyz>
Date: Fri, 28 Nov 2025 22:32:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: power: define ID for Marvell PXA1908
 audio domain
To: Karel Balej <balejk@matfyz.cz>, Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20251127190237.745-1-balejk@matfyz.cz>
Content-Language: en-US
From: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
In-Reply-To: <20251127190237.745-1-balejk@matfyz.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_133334_600455_202C2923 
X-CRM114-Status: UNSURE (   5.73  )
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

On 11/27/2025 8:02 PM, Karel Balej wrote:
> Define an identifier for the SoC's audio power island so that it can be
> referenced through device tree.
> 
> Signed-off-by: Karel Balej <balejk@matfyz.cz>

Reviewed-by: Duje Mihanović <duje@dujemihanovic.xyz>

Regards,
--
Duje


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B6DC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 08:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNGsoyzbMds7D10QPnL++QxYk90xQfRG7D6REpKWKkE=; b=pqq2AaGq1h60+/h+wmBqMCZwDE
	7pqNSIlH3Rz3ByiQ6e7yIyUSA0YfFAvn4me0/xWebq4BpS81ucaRlUyUhkUXuGWz1eCP/JHOpERU+
	OERgQzCFyXQZLgLSYQLxMkvTpYfJOyOiyszGhH+4hzgoJmthhz5Bh8kl8fRET+QoRzktC15vK+U8q
	jWyhrY1p6w1dicERLGVuc6wHY7osJAsNWG5T2U6W3s0OGNJakFHnlRFxHr6l2ARuF5GQwcrSYR9Q0
	eXZon91TBjZemCoRc3+bbBE+hIiwItBpk0F0oKq3xF37lZIux90JZeDbXD0Yl7htMlD8NI82qjsju
	BGkut1Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu6GO-00000001pWc-0Q0S;
	Mon, 17 Mar 2025 08:56:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu6Ak-00000001oGs-2Alw;
	Mon, 17 Mar 2025 08:50:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742201409;
	bh=JFO3x58H2vM/4oYxfHn0uVx+Lm738F8ylj7182GHs7A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nNi68yjucDdRGQVG4KpqLveAnQuSX00lCksWcpTuQ7DlLWlLAmKA1L23hnn6yHJMj
	 nR6etxATWsofpqNMM8vgztnNIo1296SuYic2axInVC/80BoFqjEOxjiEfsNx2BPU9e
	 ODKvSLJ/3F7fBo7qeufZh87aGygIvnDKYcEyE7iJ4J2E4HvU0IaFijgafYGzHBcmNe
	 4BR/QCCUBpaVuV3zRFT4QlCRx0p2IZz+5J916iA4ECg6LO3RId4XDcHpOmWRLkdpie
	 GdMEDNnSxnqdtzoMXo1rU5UWtvYPIjZXCVj6tGT+MNlJxHcuFkzzgBBcTLabNezY1f
	 MfEz4KwQa9XQw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 49D1817E0987;
	Mon, 17 Mar 2025 09:50:08 +0100 (CET)
Message-ID: <d0a85b86-2876-4ab1-ba0d-92611f37b8fc@collabora.com>
Date: Mon, 17 Mar 2025 09:50:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] drm/panfrost: Set HW_FEATURE_AARCH64_MMU feature
 flag on Bifrost models
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sjoerd@collabora.com
References: <20250314173858.212264-1-ariel.dalessandro@collabora.com>
 <20250314173858.212264-4-ariel.dalessandro@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250314173858.212264-4-ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_015010_706657_59691245 
X-CRM114-Status: UNSURE (   5.15  )
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

Il 14/03/25 18:38, Ariel D'Alessandro ha scritto:
> Set this feature flag on all Mali Bifrost platforms as the MMU supports
> AARCH64 4K page table format.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




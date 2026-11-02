Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7FD606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 03:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EmaItIiI;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mgm5SMKz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CeNzVZpMqNVkX0vajF12+RTJyTWzweU/XK8AXxHx4rk=; b=EmaItIiIZ/6yDN
	FyniL/RpaJ55Sru2TpH/YGfU2mCnwxJ46Wr/IBR5pgeYMiE8ztiFhC58tCPgvnBUO7IQ6ZxDln564
	+HDXraUs4JxfC9wP71koTToxiojl0Tr13hVnapEU5gzIfWJ435GQHsG40kX0/gbh0kn0WuJD/wrOI
	5wW5B2SRdBkVKRVbYI0Y9zCd5Ih7xb9pix1d6QSwmL87WE/vXrekEiIrtsateBpNN/0oIuo4FsMD/
	V7JVIIjxVgncdY0kmiCcGmISYSKX45SHJVjRLiDBdzOWQAa7wA9nZxDNHgUj0VKAxmuZerU5MVNhs
	89HwebYlffK4P+6pa1dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNilh-0000000FSDV-3mdV;
	Mon, 02 Nov 2026 03:31:33 +0000
Received: from mail-oi2-x0b.google.com ([2607:f8b0:4864:32::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNilf-0000000FSCi-0Z4b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 03:31:32 +0000
Received: by mail-oi2-x0b.google.com with SMTP id 5614622812f47-539d2baa897so1043540b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 19:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793590290; x=1794195090; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CeNzVZpMqNVkX0vajF12+RTJyTWzweU/XK8AXxHx4rk=;
        b=Mgm5SMKz/zPhykmGf+e8pd9elbWN9EqoRG3LbdYWlGlev5ru3NgLyc2cZcnuOX0bbB
         BV7xz3O09Cbf4z5EBxHo2eyCwrvOKbqtY5f9HSVYihagYBbG7znsIZ1Ja4bN/+UrVzQ1
         bMADQ1V2ZkUrRqehwCCUB4osv8IaIHG1YvpFpDkCtaf2j66xXoh30XjKbSezaMCYj8Fj
         GVaCeSM1lRxijwPja/GdBMyAehK9pahNv4BD/WIGdjy5tLeJO31tcktrBR78MLL5gs6X
         Q9ih0dFdrxFQmN+Fnu/LYXH0hVEPTCptv7rviZNnhiNBJc4SKy1OswkwTyrBfGdS/iny
         vG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793590290; x=1794195090;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeNzVZpMqNVkX0vajF12+RTJyTWzweU/XK8AXxHx4rk=;
        b=CyLvA523LuN5tgvykJ6WK7umR41RGZ/ul0Q4rCAhKctsyqy5/tiL5mYDRyvzdr9qPN
         r36TYZP9AWpl876qD8zHNUwnyYX7Wim8V9WTODhHeaYImwJm5GAh9NqXpoeyENlEEJZ0
         W6oUc0CCJH4bucL2X1aZiDP/X4hJHoMrraEARlF8joYtpLWdRyB9IFMHrLY/ZV5iof+C
         3mWVHs+QqCZkE4vxzv5fOMRAWyYk1p5Hpb2VO/Fccs3mvofR0PDWUWvLnjbwl91x7iRz
         UIfIyJA5MDX5TiC5+j6M8bNZKnmatK6nkBA3Kjt8RHQkrb37whkpkcYsPyxyE+7iuK/z
         b6Vg==
X-Forwarded-Encrypted: i=1; AKwUvBzY4DA1Em/QM0RieLzoDPlbFUytblFlKwBje+kRgyVgkmUWJRxJIAyXzThK2nP6TpEjfXy0WvzBXNakZccDVQoR@lists.infradead.org
X-Gm-Message-State: AFq9FYL0dB1dvtgPRSSI0aQnD0/pCBH6A/BZmGxfhynyYjKU591RdrLm
	jd5eTIRY6gookEg+eRpVOAbMF8XGDLRack5+mjXDXJ96vgFk4sr93qrd
X-Gm-Gg: AYBFou0YeXD8Nf0NHFExkGlBNnHSorJkvi88Zv8JZrwsZxwdCpOZ0c1A16GDZoX1LKl
	uuq3lN88eg32dexXXKcoD8eA+hWFDXXT+wBkswxFAzR2ilIuEcHg4+uR42YqByU7O87pn4W6xh+
	/53MF/5zaGrsv/N/GM2aAQZwnuk4cixCm74u8tRufjMlhdCSKccuG40nOAw7QaEDn6l7uxv/imX
	4Kodb+lTGT3/d6vzyu9IX1xkRpvp/h75AzB6jRsuKd9kL/GcMSL/aPkB4kD/+rmyacHbd0SC8sa
	UWN5MeXNfi6uzBztLdDNKBZJ8FvpY5UdjjuRKZGTZwLhZHLRkxH5jSHmAMLCbeBCKic2MNOLWrI
	b9buhOc0hK2IuQR0O9IgFSs0SgiYc9yo7fLY9g2FTYH7JVN5o/vQkrSfAm2iVILyHCfwXVtr0Ru
	2dACrZwCzJ2q4Y7tTrKPrKek1L+OzWiZ7stFUaO5+C/JNfbMURLpFpGTmwAMvNR58k/eSE654hp
	qYvBBHAaPaOHILOmxq7eI/6zue1phTSwz5glgr/5zYa6olDyJk8Wq1mlMrGAVXMs8j2SDhAgEtV
	lC4CmSkpTDVt1EGHBj3wHJzCff5DftwtBfSrTjzUHOz+i8zB3EY6s6Tf3VlNwfTl624=
X-Received: by 2002:a05:6808:1a21:b0:4f9:46b9:e80b with SMTP id 5614622812f47-5640d92b74emr5304782b6e.5.1793590289815;
        Sun, 01 Nov 2026 19:31:29 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fc49923sm6895225b6e.1.2026.11.01.19.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 19:31:28 -0800 (PST)
Message-ID: <f98c2746-a025-4a13-9e6f-2ed9fa183fad@gmail.com>
Date: Sun, 1 Nov 2026 21:31:27 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: mediatek: mt6795: fix the FHCTL DDS mask width
To: Jerome Brunet <jbrunet@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
 <20260912-mt8173-fix-dds-mask-width-v1-2-3d0c0292c85c@gmail.com>
 <88272aca-2a9e-4a75-b7f2-4f7aac8b6d18@collabora.com>
 <1j33ux8of7.fsf@starbuckisacylon.baylibre.com>
 <12e0953c-5181-45f2-b409-05163ab2a031@collabora.com>
 <e8389c1c-e858-4171-adff-5bd94909120c@gmail.com>
 <1jy0brgpez.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <1jy0brgpez.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_193131_190789_17C45B0C 
X-CRM114-Status: GOOD (  11.73  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jerome,

On 10/21/26 8:21 AM, Jerome Brunet wrote:
> Hi Ryan,
>
> If you do not see it in the clk-next now, it means we missed it and it
> too late for this cycle, sorry.
No worries! I appreciate the response.

Angelo, since you're sending the MediaTek clk pull requests from this 
cycle on, could you apply this series and the mt8173-mfgtop fix [1] in 
your first one? I checked that both still apply cleanly to -rc1.

[1] 
https://lore.kernel.org/all/20260913-mfgtop-no-clk-api-power-on-v2-1-b84771a3d5bd@gmail.com/

Best regards,
Ryan Brue


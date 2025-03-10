Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3372C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 20:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dlpjAiSLLJUkqO0ugcAgjSoBJydtUnexkUj1lX29pb0=; b=ZLW6OCyssYW06quP+Q9nqXzTTB
	MTT7fdVST/JvrggSsKOah4Y0lREcAl7BhlIJWvsUsuwxvNDZ8/v/jmPJrjfOw9YpG2hqtk6fIjj1v
	1S2gyFhRaz/RT3lmr8FcvIGZyM7qBMbB9n3CLcoo2Wf4YgqlppLWgS6b+PElkjU0ovjGIWB2zZw7S
	crlOxeCBnCpJmfO0fgDEAy5QFOUpZsrFFOwMJyfFz2Z6vk1tzt39Bp+IBwrod5oNivAxUP06u0dwN
	BOrCd5Ixf/ridPziWENHibT8dZe2NLtOlG36UOc/o1vIIhAqyynlB/0MeAa2sYBu1SuXpGVzucsKP
	KuKlngZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trjqX-00000003tEL-0qDV;
	Mon, 10 Mar 2025 20:35:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trimu-00000003jZv-3frw
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Mar 2025 19:27:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dlpjAiSLLJUkqO0ugcAgjSoBJydtUnexkUj1lX29pb0=; b=T14XKFyqDEWOdyaqfCiWFkwFyz
	NMobsaUo83/Lhi+1bIfrW0cujwHDOt90HIcOxaLSdsDt3//GyF1iKO8bBg5PlkbHFRU63wX9H47Yn
	g5IdChboIhxyq6M8CFad6F8kKPHcz7Pr0kXzEkz+LaDVkZFcNm7+m/jQq9R5pn9d2mUmayuhW7zGX
	S6CqEl68EbqJ7beppkj3iKBmI3Sk/4/bxjCyMQs50vY6bd3HVGKPAiFl7/UfC1HDqFrALYictZCiJ
	iIYmIs5gBMecfJ/PyBc3SleAKRek0Ih4P3R/dGSLjf6A98tMIg/cgd+STfF77PwVfcS4c58t6x2sn
	LrHZT4mA==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trims-000000021qu-0TVQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 19:27:43 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-38dcac27bcbso3740718f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 12:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741634859; x=1742239659; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dlpjAiSLLJUkqO0ugcAgjSoBJydtUnexkUj1lX29pb0=;
        b=amxItU92t0tDwBbJ9PdOyxxd1KN70ISulekRgK4kAArnXQlY7k6ww56PqUKHPa7yc0
         uikm+vwAbj6DPzw4jD+K4u84aa1ltYizryyCH4Yr31Cn5bEJ/ItJPbNJWAWgg1yJRVZF
         sQgrNk+2vvQlcMQi9P2q5bpKJ1ER2iFU4gwV6jFYqkNHNSbyArwePVxEUVWCpe1/92ns
         b/40i9UeY2C3bZVXYNNljb7irnZfR6OgW2ETCQhvw7CZURt7tiU/pVUa7jkN8V8Y1NoG
         bkk7iCEDkmOyHQbejG/4QbS7nGO8e9uTQabYoXAXktfZOV7Q21FAT2H7hC4v7uKyBq8E
         4wcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741634859; x=1742239659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlpjAiSLLJUkqO0ugcAgjSoBJydtUnexkUj1lX29pb0=;
        b=RHSgJMqxeMpn7oGP1qQJkVGSuisB5E4zr496lcw1BZIwgVMetbJx6a6lsclVGYkurE
         R+44XDWj0fiz/LMLWub+HAGiNXB2RhBZozdhWwOBP7nrGeNAGhOBV7M93FZ+jFKtZ5v8
         NQQ2w13BDjvJav76W3PqEo7Jpf5SuM6gQqSat8Q4d4a8JPbSY8DDRLb3qvx7/THTYBNP
         vrGNT02s1uWh31T8mCk7lrgjGulWBMkzmY803+2YDNGTySAfzwnJmTyl6Va5wOiSkcsr
         +ddtOhLh0tPzBhrEJ/25i+EtnLR6xkeJUjw9hFhBnqirg55TsJhwYJPGZ/NnV8mE4r27
         XEPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcmsfVHaC12WYfYgiT242AEXTjhqT7qqewYZWP2F/7fl+1g23KSxgWEUEDkye1Dwbx4J3NWHMGcSlSkTaiP6F+@lists.infradead.org
X-Gm-Message-State: AOJu0Yw36FjfBEiwgjPjZFrmkgGtnuqWB2jx4mgzKI8/C0v2zcYKNhbT
	xlzJpiMt4xvILlVEcu0oa6/Y7Q9bh5qsYveG1NCJMRvyUXZ4/fi0MUxvv3ZAbeQ=
X-Gm-Gg: ASbGnctOS5p5ggS6NobzYoE4ipEu9R1nNdTUcnLpojbCqEvXukG3T3gvEp8j9ksEPlJ
	vrgXQDatMdkpraAz0KXnC4Flis3MLqK5BGnP2oBd+tZa8qPKVfQ0Yyld6ZJk98+AGHmLfrVIpNH
	cIuGJ9B3UrJkr6hrm6BrxdstX9a48ToX/LSrmpnXyjZRFzsFGk+G8DS0vJddNGj2SX5k7Nd8Ihn
	4dHxrslL89Xl2TYvF/ey/DSdEaOArGZ96AVj+A3YsRJCmR7T537HqN2V1lfRZDRF0ONC/nCPqpj
	UMxk9kZ5EqbU0r/nC120XM7XEmAnEyagvKm5bMU8bTT1kKh1Eg==
X-Google-Smtp-Source: AGHT+IHyKkXj7bFHamDlhb852Q/c2KxdopTfCVoENlr9lgDt39iEHp5/omYhrGf0mlW3wl80G2nrEA==
X-Received: by 2002:a5d:59a2:0:b0:391:1218:d5f4 with SMTP id ffacd0b85a97d-3926d218075mr917718f8f.23.1741634858689;
        Mon, 10 Mar 2025 12:27:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912bfdfdc5sm15554352f8f.25.2025.03.10.12.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 12:27:38 -0700 (PDT)
Date: Mon, 10 Mar 2025 22:27:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: mediatek: Fix bit field in
 mtk_set_queue_speed()
Message-ID: <aab6d5f3-7ef9-4220-8b67-ee9b09a5f168@stanley.mountain>
References: <eaab1b7b-b33b-458b-a89a-81391bd2e6e8@stanley.mountain>
 <Z87e75UV0Qc4oY64@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z87e75UV0Qc4oY64@localhost.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_192742_231699_F9C8A0D9 
X-CRM114-Status: GOOD (  23.20  )
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

On Mon, Mar 10, 2025 at 01:45:35PM +0100, Michal Kubiak wrote:
> On Mon, Mar 10, 2025 at 01:48:27PM +0300, Dan Carpenter wrote:
> > This was supposed to set "FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 1)"
> > but there was typo and the | operation was missing and which turned
> > it into a no-op.
> > 
> > Fixes: f63959c7eec3 ("net: ethernet: mtk_eth_soc: implement multi-queue support for per-port queues")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > From static analysis, not tested.
> > 
> >  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > index 922330b3f4d7..9efef0e860da 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > @@ -757,7 +757,7 @@ static void mtk_set_queue_speed(struct mtk_eth *eth, unsigned int idx,
> >  		case SPEED_100:
> >  			val |= MTK_QTX_SCH_MAX_RATE_EN |
> >  			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_MAN, 1) |
> > -			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 5);
> > +			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 5) |
> >  			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 1);
> >  			break;
> >  		case SPEED_1000:
> 
> 
> There's a similar bug a few lines above (line #737):
> 
> 	case SPEED_100:
> 		val |= MTK_QTX_SCH_MAX_RATE_EN |
> 		       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_MAN, 103) |
> 		       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 3);
> 		       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 1);
> 		break;
> 
> I think it would be reasonable to fix that too in the same patch.

Yes.  You're of course correct.  I'm trying to figure out why my
static checker found the one instance and not the other.  I will
send a v2.

regards,
dan carpenter



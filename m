Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3902F606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 11:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sEqqbFBT;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bfTYF8yk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/TXd5dPmQW/FdjoYQcFG1PodSXgdJZsvkRdQUDNsOjE=; b=sEqqbFBT2QK88o
	Lzvwim8sgElIps4BM71kQKFKuiibGDqVsqXwK5rZcYhlHfymP/UOKi1WyJRociunYNhETDS9oVtj1
	14HdcgMvyX9mHlkEr9cE3HngMcLpCeET15i/5W59BUUv2Q0OH02lzhaa//PMkFexEM8vVWtlU8pwZ
	jJuns3Ov3ssOtPK2xLIk4ME8z/YOxQXutFfs3HZ7iJZ9RfsU4j7ce47guyq1qbv2l4FKmlQHwwnge
	Wnd1/WOSpA+7A3YXQWKnULEfLg0xBoNlmx1tHU2SztPUCsWziMqvbMWeBnz+yPlPpbtoQKKpEA7ar
	zC5AMwYUncQNSdi5SzYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJrKT-0000000E2BK-3SvD;
	Thu, 22 Oct 2026 11:51:29 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJrKR-0000000E2AO-2rxb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 11:51:28 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1118874f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 04:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792669885; x=1793274685; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/TXd5dPmQW/FdjoYQcFG1PodSXgdJZsvkRdQUDNsOjE=;
        b=bfTYF8ykGgxZKSphZBaMKhqTmdSZBzCCZw0TyfTfRtu5Tu1tHcO0+wTT3fPuar848o
         Xp1kTzHnvs/pT2ysHnLHlcNBowjEkjEvDRdoX4Of/qU6T1B/xNTSjm9Tyo6Doppg9cTs
         e9eorlHC0CisaM0j0M5TNbYjuswj1cJ0P3JXppeUxvyVAmkTYzs5rZlte0PZtFrJu81k
         awIFV0VhOoZ3RqVGB9J+mCFtupctdaUg/6snA+WcpH0Q8G8WhuKJIKQjEzvWG7npJJ0v
         1aMy7UiZHx3Zt8eHMS8fIEqyqUyd3QxE8nJX0nIiZisq/+ci5WBkkMdtNfHFbf17ybD1
         Up1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792669885; x=1793274685;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/TXd5dPmQW/FdjoYQcFG1PodSXgdJZsvkRdQUDNsOjE=;
        b=vV3sjrLmPoZudBfjs9GDX+OO0jBp0GYK0pyrPVzpP6C0hu8eHPiqLwOwaPv1W+95LQ
         ymLGJHODSW2rcI4QdVA5EuzJEO+uOi1nn6AoaTNT7JUk6CnHRMY1WUe1jKpwQwGPaN3y
         5IIQcPBibqPhzG4NTdDWyKf3rJqWUPKyCiv5amfL8Fho7hbwzij6KAvt47YCN53bRXTJ
         JYnXo2oRpobCDMAohUl2dg8GU1LK4tvNjmiwVW2DY5Dcdzok7eX+ge0y69o45g2DxmkR
         2pHF9a14HazDNACRNoU82DV5nak+HeXmFdIjQFXcEQWJdIP6KFNaTwuV5GG+KDlrP/zw
         RIwQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6YrQNn5Nz5ycS3LH0T6CusWVv2rOEBgFZCn+eyeG2Ss/GMRATaYnSSt+j3BF4H9lZus/r0D9EdRWpkC5amxjs@lists.infradead.org
X-Gm-Message-State: AFq9FYLGHjX1iC++iO+frJFqheoj7lrsgMbUwZjheKngStdrFGp1tSCv
	Rp2F4j4v6NYeDfRJuuwl3B0ygzsRxW+jYT3W8lFVQlBJc3Lg5wgDqOS4
X-Gm-Gg: AYBFou3Oa0BoVZx+QogovgcKGmu+64sTtPLX5pIeqdkDqiFfBNeUU2MMCid3t4NyCKT
	UR77xyOkc6mR2TAJLGohYcrCTIrbHJSTQzucPrflexyx8WDquwrnC/5jDhp72VI4UWm0Mp8n6Oc
	Infpu0qw7Ht98SnWJDGbl+A37VPPO5V87zir2OR6Ec6M/mS4MNjpZoQ6LHZUvUr7E0fUqjlDo3U
	TZkGbVDhQhdocb5cou4A2+3OKM3h1C99O1HLHO5wOXCh8cY8axjfBAaesEeGrgICJCiTZ+JbQ7v
	rdM8jBunZ93W0gXUSjxHN59blfvikoksiGGlrpgYNbeGSchnGx+4hzNaD/nHfwuSnyN2lPGPSpd
	dfB6ADV63NAkdv9Bpm6V6QXYKw6nUeqqqsneoXLgaF8fK54Ym+jIW12hfqMpraeM0OAhGqig/Kh
	/UlklBpnDC5o4Ye6WRY05hZSRBxyTDGI0qUk6MNJeDeH2jCvLmhsu0twyuWyUYQm5e9XzAOWUO/
	GzKpkcKQWDoFTHpvUi+vGEdSewmJYHkWAJ2I2UvbDih0kqQJ1LgYQk/OIxo3iSqC0OG9I4d7R9N
	Sxh9vyr1JyByfh7Q
X-Received: by 2002:a05:6000:1864:b0:48d:f4b2:b29d with SMTP id ffacd0b85a97d-48e264e8a10mr10554202f8f.53.1792669884742;
        Thu, 22 Oct 2026 04:51:24 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254f0bc2sm11722358f8f.1.2026.10.22.04.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:51:24 -0700 (PDT)
Date: Thu, 22 Oct 2026 12:51:22 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ninad Naik <ninadnaik07@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: mtk-snfi: use min() in mtk_snand_read_page_cache()
Message-ID: <20261022125122.75a0d528@pumpkin>
In-Reply-To: <20261022102020.107609-1-ninadnaik07@gmail.com>
References: <20261022102020.107609-1-ninadnaik07@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_045127_783983_BC967439 
X-CRM114-Status: GOOD (  18.51  )
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 22 Oct 2026 15:50:20 +0530
Ninad Naik <ninadnaik07@gmail.com> wrote:

> Replace the ternary case with min() to pick the smaller of cap_len and
> req_left.
> No functional change intended. Compile tested only.
> Found using Coccinelle.
> 
> Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
> ---
>  drivers/spi/spi-mtk-snfi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-mtk-snfi.c b/drivers/spi/spi-mtk-snfi.c
> index 6e96e50fedad..bbb65a21a684 100644
> --- a/drivers/spi/spi-mtk-snfi.c
> +++ b/drivers/spi/spi-mtk-snfi.c
> @@ -1017,7 +1017,7 @@ static int mtk_snand_read_page_cache(struct mtk_snand *snf,
>  			if (req_left)
>  				memcpy(op->data.buf.in + snf->nfi_cfg.page_size,
>  				       buf_fdm,
> -				       cap_len < req_left ? cap_len : req_left);
> +				       min(cap_len, req_left));

If you are going to do that then join the lines.

David

>  		} else if (rd_offset < snf->buf_len) {
>  			u32 cap_len = snf->buf_len - rd_offset;
>  



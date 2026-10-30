Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA55D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 10:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C05fABeb;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SAH7LPu7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PqC2VGlCGIsA/VW7WOwQfmzHfoq13g3huhkoZR49dMA=; b=C05fABebi8j274+xaBQ1u4VZem
	3iE4Seg/ol3fp20C18Q+eAq2FvFwHTfsLxSDV44ctMCCawdIrN+Jq7hDV8HXZjgks+U45g7Mq08pS
	rvJcupmohGYjTrgo2Pnhka/Nk9oZel6jI0eCTK0rfGkQv7YU3itMXIb1Md3NtlPkh7D5q3h79Tofp
	39pn95oyNoMPqQZqjok9Tfh//M3CoaC0p6dBYy6u7tnsEx4RCKsInQmV1iVdeY+SpHgeOpQw6xcGW
	RZMPaiVjFVAmYkYT6c0TaBRQUlN72L1rnnceP9dYW6cD7d0mdPf4YzmQ9fN0xS6VYMQlQz6iw7/Ym
	ZnfOZoQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjhO-0000000BNJY-2iRy;
	Fri, 30 Oct 2026 10:19:02 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjhL-0000000BNIq-1cCI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 10:19:00 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso266528f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 03:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793355537; x=1793960337; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PqC2VGlCGIsA/VW7WOwQfmzHfoq13g3huhkoZR49dMA=;
        b=SAH7LPu7aBMi+SF5X+H5eesjcXkq9UjQScWlQmvVzjOz5/7RAxZKfLP0PEbykCRxO1
         HXt8OoIRV74yJB91tKsaErLb4DLvL34di7gJNK6aw3OnuvDcpn4e50pqXSjIgrECLakO
         ERwnPn2t/punw7wejcQ6VubQR6oyCzXYTDwPm+dc+RmH7yqnW0Lw30hjxUy8rI0SHucO
         FOyLcToenw5W5G5KpalFSKGGXFNxSctJMAUWoUJKcrfYweLh6J6ZJIIXbl1aOaGb0OTV
         y/yHrSzYTEISaP2Yxfs0rXQLo1EPYbOOeN0GnOoUPmbsIajDmJfETBbRf7+4lEO/owNV
         4xbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793355537; x=1793960337;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PqC2VGlCGIsA/VW7WOwQfmzHfoq13g3huhkoZR49dMA=;
        b=D2vyTPbrGNZQa9Ux9yfOM9oHzLGjmn0VopD5o3set5DP2X+mEtI5+NFQdu8CcIQr3x
         TW0gZlVFAEHozsKTD9apw41Z2fq5nZ2O8/BojPBiJkDnq8CioMVgzd9LUP2goBDmIYeJ
         IsHCoXWcBEu+6CXvwxAOnnl9EBc0asdfByG20k6dOvIWgqPduJFtEBoAFQ9hpDS7M4OB
         jQNgQodj3P95v9dOGngrzW4hWvlyO/dSegqDKWd+FiwkOa+0aM+SJ5TrS65+g7429ob6
         eAshvrTmewNc2AEQcTrabbgna4848kBNzQvb0cwq6O10EuvYWxY2qsLKvq49h9nQhJ6k
         ApuA==
X-Forwarded-Encrypted: i=1; AKwUvBzREoIiI0hQzZwKFmPxdh9OpXFkX+ii1UKBd3+flXvOgNxR76eKKSQ139WTdtG5NDtMifnyabBaOAAxR+z7VUAD@lists.infradead.org
X-Gm-Message-State: AFq9FYL/RXblRtk6UiBnHd8nIqdzN1q6W77x8K4Ffw50K8a3+1fI6b/e
	FrlidyMpRIWSPf73OoBFS6a40exOKOlDYAxmxTSv+cB6toxx/Xn50lfM0CcgoWlnBG0TgiRpuRo
	=
X-Gm-Gg: AYBFou2NKUCfGB3B2qqiZt/e3WE64Ns0d/PFGB+Jr/Mt64U/XR9W9tK9h79Zc6ys5qN
	oIC4h3y6bL0rVXhrQ0kei9F7AChg85PXbUA2fviIzWOXw+/XaHNnFh53OGqMcctEvf/gI97uGYy
	HHs9/BSrl1LLmqjm/ulH0/9ez9p2k5lWkoiuZTBy7x9a8hQYAYrakaC/8dTafhVncDzsXOfw8Rn
	4e6iyYZZetmuJQhSyIwasgfeL0cMaAXs9XiF7HewowEsLaPFs4ZdSlp3T9YSYwCXjSH/32ayRYu
	HoDPjPENRtYHhwRQD23ILVrNgcNx2dH1YRI+u8Dq7acwT935E8af1s09H8R8F9aXq1QAQrvezX8
	5YSJPnpasW0jST7EHBMpj2y97QcuNmM4KQ2dI1AtrMC2LpboiLXl85woLvAh7zRsehZsLWZprox
	xrOjTyrj1Ptxmiw4U643bdDuKiLXFxYBtnDQrhZd79VPIZf0OWsPHclMlCRQgahMpJL0feel8IE
	ovkkmJSYnX5lJgEfmDyns/x9dvLmXvbRIC6P89HoK0zhV/zJvKOKOCEh7RsAAFwVJfhJqDlf8Le
	IguHDlddCnbPm0iClv6Ak3sNvoytbHQb5fR7m18LXNvQA0qu+SE863nuld5Kh0fOxrBpe6iiMzA
	EJUxzGq2mBSiMzrw8CZZ8Lm4nidaRJ9Rlr3iE7r9NcXUc1KQaistEbw1jwu/tyjfO9BaZ8N/+sV
	iO2Ng06xQ6dMp4
X-Received: by 2002:a05:600c:4ece:b0:4a2:40:8d2c with SMTP id 5b1f17b1804b1-4ac17b2c396mr36235115e9.26.1793355536801;
        Fri, 30 Oct 2026 03:18:56 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a5a7sm2410452f8f.37.2026.10.30.03.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:18:55 -0700 (PDT)
Date: Fri, 30 Oct 2026 13:18:52 +0300
From: Dan Carpenter <error27@gmail.com>
To: Anthony Liu <anthony.liu@mediatek.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, Sean.Wang@mediatek.com,
	Leon.Yen@mediatek.com, Quan.Zhou@mediatek.com,
	Ryder.lee@mediatek.com, litien.chang@mediatek.com,
	kun.wu@mediatek.com, jb.tsai@mediatek.com, emery.hsin@mediatek.com,
	linux-arm-kernel@lists.infradead.org, ingyujang25@korea.ac.kr,
	shayne.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
	lucid_duck@justthetip.ca, matthias.bgg@gmail.com,
	eason.lai@mediatek.com, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] mt76: fix buffer overrun in pkt buffer
Message-ID: <auRvDN1KPy_qhb_B@stanley.mountain>
References: <auQjsDPP1PeJg5sV@stanley.mountain>
 <bb9c40516e7379bf763b1ba7cec228c354494223.1793351111.git.anthony.liu@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb9c40516e7379bf763b1ba7cec228c354494223.1793351111.git.anthony.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_031859_464285_FDF269B4 
X-CRM114-Status: GOOD (  10.65  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 05:05:54PM +0800, Anthony Liu wrote:
> The last patch (d4e5ca3483a0) addresses mt7928 F/W 4 byte-aligment
> requirement by reducing pkt buffer by 2 bytes, causing the chance
> of buffer overrun.
> 
> This patch reduces incoming skb length limit accordingly.
> 
> Fixes: d4e5ca3483a0 ("wifi: mt76: mt7928: makes struct beacon_tlv 4-byte aligned.")
> Signed-off-by: Anthony Liu <anthony.liu@mediatek.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Reviewed-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202610172141.mmRmGqow-lkp@intel.com/
> ---

Thanks!

regards,
dan carpenter



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A449C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 03:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9o0KljyHVk+7sXYfHcEUOJPUxLqwYfEPoUFxmr/QpIE=; b=rptWvObcZ36DbV6mJ9gJ/SkPc1
	fvy1Rp+DZ/gM+5J2IubPIA7ASdKBaaS83uGpacpwdhHYXopg7yR8qp/V7Zz8S2+buNZ9T1SpBownp
	oGKERilNtyOqdXJaaFRrXx0yporJScIempJ+5SEOoWNMHontwazmP5Qz+lww+PyeAj+1XDfOQ2Uje
	76hXWfwmj6qTFIEvrwlQA4rgMyWTIJ3zAz8a5lF36I+QGfVlQeInA/JO+YUAUrqiJLvP2pU8xvGX4
	DvfsnLh4LQgDDG92xBLg22VsEW35gUmW/T0sQSCVRwymTUQn9Kp8YpSdaIpwZHPf7AyahKJgdKzis
	ayb7QX5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUHHx-00000007Rcc-1MaF;
	Wed, 25 Jun 2025 03:59:09 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUHFb-00000007RUL-4BF0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 03:56:45 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-234c5b57557so67351345ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 20:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750823803; x=1751428603; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9o0KljyHVk+7sXYfHcEUOJPUxLqwYfEPoUFxmr/QpIE=;
        b=mN0E95gDo7hgGDRquZMz1ec8sVcnd5Oam0LgnzZ2vMRmJALtrrUYB+kMg0a+ET2DUY
         gDNhIsepGsV+zPhKZdH3usCUJWcXaNHFxCY43aUjhyWlyzu+m7zZWltj3F8P/tt3+OF3
         L0+Kre7PMDViVD5NCyTzBgFjOvO+64OGXzP/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750823803; x=1751428603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9o0KljyHVk+7sXYfHcEUOJPUxLqwYfEPoUFxmr/QpIE=;
        b=RPCBnQ8bS4/s2/0xbv5ZI5D7NiMCvNm8gaBg/HvUKw91bGh9snl6kK4NYpR+FE40kc
         tw5ufAuhyORgHLkaVHQeXyzwIF3bf4UWuDrP1TcgqtN8gMQZ+x/3hfRd8QraOhylUxG8
         UylbMJkUqRGHSu2hXpGqg0YKQ9MlY17ou81F6NM4U7Y3diJFIn5S4+ee/YVkYHvJ2r8I
         wx/zJHE+bfXlCNHxaLAPg2X83rOo0J+HWeCYro56VqGOQKEcHKX/rSHxEdc/ITCgaFOw
         iaRn1NqJKCt5T8MDO8tvoaJNi2UxlJ4zla892NalnPojwcA6AUfLJS33TNImpuDEfI3C
         0KoA==
X-Forwarded-Encrypted: i=1; AJvYcCWDRvacnvFVzFk5S2/hAHZCi9mDfLH33H0lJAXU1C4uBxKFTwvGycwQVjbEhXzM2s2AgRfCQoSTHeDQiItR+//W@lists.infradead.org
X-Gm-Message-State: AOJu0YwueyhKfFoJBJ7vxOB853kZa0Ej3smG70+DECORf5GUF6oCB4xT
	xYSTe6b2Iq/bkFxTpZNI5g8RblFcNKKW3kL7bqSBnoeAa7Rldytbz0Br95TzWBBDmA==
X-Gm-Gg: ASbGncvTSDniC/3YNy3S4RnBfYQakl/SHFx5gja88zrCgKUG6CouekC/IV1eT8TCmOB
	X0HgJdWoo7p4r6hfJC+y2AWAgWtPCtILdG/uvYVTfzb5+G4kIi9Uu338898VfGBBw5NWFqaFqdM
	ssvztEbQ4jj52pzFINJA3mm6qqmXuZdF51QN9Z+MzQtytTWdOa3U5MP+lSUYoPUYT9q/9nhk141
	qNkZ7InyPqaTfMhsHe/f8fN8+W47ije0BSOwpMayvJEpMbAxQziA43fsEnKfuAbkHeHDVDZkxZ0
	dKZBD1K1zIj/OqNsvJJ/cIjJpiD61hQ/lTlcRH3xTKZQlWU/y/JX2kADtMU+3TBDJw==
X-Google-Smtp-Source: AGHT+IG+CeEoTYFYhlYaB+yW8OoKCv/2xwINqlcoXHtLLRpl6uhTmRRfAU8psN49GXJz73OFHB26Yw==
X-Received: by 2002:a17:903:1b2f:b0:234:c5c1:9b7a with SMTP id d9443c01a7336-23823f65e32mr21155175ad.8.1750823802811;
        Tue, 24 Jun 2025 20:56:42 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:301e:ee9a:3fb5:c761])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d875bc8asm118910865ad.258.2025.06.24.20.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 20:56:42 -0700 (PDT)
Date: Wed, 25 Jun 2025 12:56:37 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Tomasz Figa <tfiga@chromium.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mtk-sd: Prevent memory corruption from DMA map failure
Message-ID: <kgxqtfdrlc5m5kgprjajt4xtngken2u2locauzhsxm7kcowusa@44ncy4vhy5vx>
References: <174972756982.3337526.6755001617701603082.stgit@mhiramat.tok.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174972756982.3337526.6755001617701603082.stgit@mhiramat.tok.corp.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_205644_158323_A6F7F68E 
X-CRM114-Status: GOOD (  15.15  )
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

On (25/06/12 20:26), Masami Hiramatsu (Google) wrote:
[..]
> +static bool msdc_data_prepared(struct mmc_data *data)
> +{
> +	return data->host_cookie & MSDC_PREPARE_FLAG;
> +}
> +
>  static void msdc_unprepare_data(struct msdc_host *host, struct mmc_data *data)
>  {
>  	if (data->host_cookie & MSDC_ASYNC_FLAG)
> @@ -1466,8 +1471,18 @@ static void msdc_ops_request(struct mmc_host *mmc, struct mmc_request *mrq)
>  	WARN_ON(!host->hsq_en && host->mrq);
>  	host->mrq = mrq;
>  
> -	if (mrq->data)
> +	if (mrq->data) {
>  		msdc_prepare_data(host, mrq->data);
> +		if (!msdc_data_prepared(mrq->data)) {
> +			/*
> +			 * Failed to prepare DMA area, fail fast before
> +			 * starting any commands.
> +			 */
> +			mrq->cmd->error = -ENOSPC;
> +			mmc_request_done(mmc_from_priv(host), mrq);

Do we end up having a stale/dangling host->mrq pointer here?

> +			return;
> +		}
> +	}
>  
>  	/* if SBC is required, we have HW option and SW option.
>  	 * if HW option is enabled, and SBC does not have "special" flags,
> 


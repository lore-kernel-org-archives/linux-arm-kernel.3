Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C314C8302B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 16:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFMt2MdBt4V+3jVyKnzW2CbyNPSCknGZaPAUm9S6KuY=; b=S1669MRqaKJeobyAty/nqxiaX0
	scuoLT0VTnvV7ykyBQW3zrlfGn1wOH3YGQQ6UCFszbph85QA6VmZisQ2lvYn9Pr+83P5sRpKGXwI9
	BTomZOn60iGlRT1GCHs2MNDMiYzDfFD4gCwthGOkFIUN0tJDvgD2H2zvjUv4VDFWN0YOuYAaUuV7E
	Q8vv5sPFrk0Ciqrfux2Fr9JWsqgClRlFfJs/+lVw7VBRy1krhOD+bSQJYkdhRfMx6rK/1pTFAu6MX
	wBXug+vhAvoDfR91gDMga6rHMLO/rs8TodesilWqsZm28qV+f26uYgLrmTGFdbwyYOAd17h0avWUx
	r5aA5GOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWHAT-00000002rNT-1YOj;
	Mon, 30 Jun 2025 16:15:41 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWGNV-00000002kEV-0TFC;
	Mon, 30 Jun 2025 15:25:06 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b2c2c762a89so4343582a12.0;
        Mon, 30 Jun 2025 08:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751297104; x=1751901904; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fFMt2MdBt4V+3jVyKnzW2CbyNPSCknGZaPAUm9S6KuY=;
        b=OA6SHVBd/wOKoQ9Oz6UBoZLWUlktpY443zY25pgJYvynaK7RtRrnFNp8tBDtU90Mae
         OpJL9vyb7ePC4qjTRpYM9epvan6EAhX/qhLTdmtnvFRBzhK26fcOMxKpmJWgwKsSNZVM
         5eKX06Ete+qpcm11FWsl7CMVwu6rit4IrOd0uNoEo+0uljKxwvYFk6tn6NGNvzwsYSKj
         3RVIqXjiUAZ60WZRUHTrpcuULxJAgOG4cM0BAj94N+meP1AuphrCaMuZNSAXeAkrkV1L
         WTFw4huN1b/qoYk2jRb/2TisgmAhTRHNt/Hci0VtHJHLCaBQB3uQzuN/o18/OMlmYA47
         1dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751297104; x=1751901904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFMt2MdBt4V+3jVyKnzW2CbyNPSCknGZaPAUm9S6KuY=;
        b=miOXCZxYm8NxPjOIsE0mAAjxKfeEGpWIihCz4WPdQhTx1tY/e8vQr9yeaXr4FPHPUX
         dM3ZKQEb4yUbSNxi6QVdCFKxWdutnxL4uJ+9Ja1utJJxMSRlTSI60jNMdLII6V5WIZMS
         twKOTYq3WoBDBzpaVMZKlHvdxygwKpAhkbCmc+WC5TbfE5RC3iliYO+qNPziGF21cn+P
         kCbVzY5APoznxG44yn5pBFYw8tSj5zkIWMjdybIl2W2Qod9NoKBLiSW8MsRUygZCzLMJ
         zF4dlP3bDcwgAnMUHnSGyfKqcW0I7DvlGzZMUy+/AxlK6IAVtDCPpmluYVC2i8lV+azN
         VaqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD/x6OBdYg2oyffdZ7aXjj6xccNKuTh1ZuIUkYfW+OurKrQcK1b8Nz3d1gfCuHKqZ6liR0jwadtcT8GEPn3Exn@lists.infradead.org, AJvYcCWp1GjO5PZwqAFDh+xKTTqamwF9bjg/iDM5CaaOs/HAk9N2G0hYzZD7YUhexSlCwuIctkI3a+RL6o38vlsmieE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwNELcTDk10Ze9TynWemJEKtvcni+gxoj/rWwmxVIR7jPXvFFWI
	39QyGiTBtHGY7qF1V/E86Zhck8vmsr/81ZTUibJxkPzdtn2M59M6ZRtN
X-Gm-Gg: ASbGncsGoyZUGt9ImXOUKtZl8yW/5mFA6NLPilQ3tDRc6IkASXTjOfZd7ilPkD3hJj2
	z2w8zSAeIpQiuVM13OlaD89Po7YnJ/DsEE4ZGnuvCHBckCMXZEInnAssAn8kGQ+BFpYSXbGn98G
	UKkK1ll4lvDjnDrtjjtZT/LtrgYOEVL+vtmDaQBn04jQoWZY0Noa6TpJgj/HSFPQ99TvJETe9NJ
	ffOA5l5e8Tnxh+a0tIxnDZ9PlkFo6s5c080sWdsQBBR88XdZkPUNOxmyONUhcjMdyK3s28s6oBl
	AhqonnZaAiUIDeBSCg+KLyWDg4AIo7dBG7McCiR26/bl9L7Utkb0XGvGNNEj+Q==
X-Google-Smtp-Source: AGHT+IGi/BV1hm+wNmwcS/bd33jUP4+OQR0MfEr1fQJGvAe2GucDnTzkLjVIBYkKRzDtwbp3LLJong==
X-Received: by 2002:a05:6a21:329c:b0:220:7994:1df1 with SMTP id adf61e73a8af0-220a16e46d5mr24227498637.31.1751297103625;
        Mon, 30 Jun 2025 08:25:03 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c92b:c666:1f8:990e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b350d81f0ecsm3185769a12.27.2025.06.30.08.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 08:25:03 -0700 (PDT)
Date: Mon, 30 Jun 2025 08:25:00 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] Input: mtk-pmic-keys: Fix null pointer dereference when
 no compatible data
Message-ID: <d373gpdyqejppdysdbb4k6aat5i33epnqsebxdkjbrgfwsnqtm@43si4kmjvsmq>
References: <20250630-mtk-pmic-keys-fix-crash-v1-1-e47351fa9d1f@collabora.com>
 <28111607-d5a2-4b54-964a-d010fb99193a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28111607-d5a2-4b54-964a-d010fb99193a@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_082505_149356_56B50A16 
X-CRM114-Status: GOOD (  13.35  )
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

On Mon, Jun 30, 2025 at 04:06:53PM +0200, AngeloGioacchino Del Regno wrote:
> Il 30/06/25 16:03, Louis-Alexis Eyraud ha scritto:

[... snip ...]

> > @@ -316,6 +316,9 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
> >   	const struct of_device_id *of_id =
> >   		of_match_device(of_mtk_pmic_keys_match_tbl, &pdev->dev);
> > +	if (!of_id)
> > +		return -EINVAL;
> 
> Please, change this to `return -ENODEV;`

No, this definitely should not be a "silent" error because it indicates
there is something wrong with the kernel.

Stepping back, why do we even enter mtk_pmic_keys_probe() if there is
not a matching OF ID? Are there any other patches that are not upstream?

Thanks.

-- 
Dmitry


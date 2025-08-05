Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B9DC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 10:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CuKxFEasqrRga1svukmOdXqoUcSU7DlhJE2c0KdevIw=; b=YD3lby1EFxGJtcvDGkFHCmXoAr
	ZmAkuHW9c/IBhymzbMIiKw+0k7K9gg1O8jARUr2kDC4evcm5cV6pcSjdJsN5v55iUTEKT2LrEs00O
	pAkAD5qPchVgAiHYyL4JrfXRLwFGkLeMNNGobSxp3hEIcT96Qt4s7oSLowYdl9+GpMY88g2SNWgcS
	g83nS2U+dZfQVhX2NvKiwEtob7ngeoN3DR5/rl544uXHsG1f0/Zm9BCF4BsIQol2o0uwnHJ9D3Cr8
	+nBLwzZPqVAwbnxhmFPgKWJsfi/7DYhUR80oyzzIELwy1vCYAqHTVrny23e/SNvj9EZ0j++Ho4MEl
	eB7g7mhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujFKI-0000000CXjt-369g;
	Tue, 05 Aug 2025 10:55:26 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujEtk-0000000CUeG-3ytq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 10:28:02 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-acb5ec407b1so783658466b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 03:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754389679; x=1754994479; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CuKxFEasqrRga1svukmOdXqoUcSU7DlhJE2c0KdevIw=;
        b=gToPFN76Y2S8N/JGjHFehmzyF/KVC3KHeJIo2Si9ciVuCTTpgtphCgLhf8tvWAwwvH
         aSQyv3TO8/nrqVopdRnxbkJlepoeV5CHjTPvS4kGh9GEiaAhWV2fRrQgKp2SQQL5S687
         xvDK3RnQ4Q+xwKtqrqdxiw/T/xvK2ia3SM0AkewX7sFrfxHuoD5Dwnu6VAVdFltazwvp
         ldu/aiEl6XBqjuGCpGcd4fO0JKDv6j7B4PI9zAlPJNWAOP9twKOAdA/7ZoVHz1nu+N49
         WcSWravfNPo2KVMYgbgbfjIFKCQ5IcMhKy659qoc+f0v5ePoR41BcXuwtvWVluHhoilO
         /XaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754389679; x=1754994479;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CuKxFEasqrRga1svukmOdXqoUcSU7DlhJE2c0KdevIw=;
        b=r+teyKZicL55MIyLDuJkuYkCCU44sEPT/JGxKScuxOsroE8NuFRkpujxjDu+eFTQF9
         CPrffHeymkVTa9eaK+ClVRigavIrLuWWT817DF/tEcKo1n0iMhgM4dCBwT7jlHU0parx
         B81vkSoTmcq95O7HI/6zSRkEbcjqT4pfeq2XrNgNuPY/Ha67hWfSutU8HUWe3Wn961mB
         R2m9UCr73PoJ+aJJWAopm7DXmbrbWFxW/+Ff+FdUl9ByhJSDXScOn3lcRe/RPDRZLQDO
         Vyd1oRAmyLZfgsWIOmYSDu2611r4fJhfguyj893usTejTo9gSfpXuSszL31FhCF3aNHm
         zSyA==
X-Forwarded-Encrypted: i=1; AJvYcCWYp6Xmqv/40o+K46Q+007+q0NbIEHdN9yQ4O/PtCEtwXw/22mm4kreOgiLCrAykZ6UkYk0Oo4wpqEpuUYHm/td@lists.infradead.org
X-Gm-Message-State: AOJu0YydMIDG7axAFHsJ6/T8W1GXjftxJYrWnuYVgJYdhhS7M1OInDFb
	B1jTzusAx5os88p5/O1a7otXth90OidigDkRP28Y18KHNu3azRUTi26qbh1B3p1T5Ngtm8QzTJw
	WWKo8IHftLMAhsTPl4uOtdYUBwB4bwDhAHsI25SwO+A==
X-Gm-Gg: ASbGncvNq3wpXXFxvfVhNl4Eo6tAyyAOYkIGJfl5B1XtFLf3OqQwqjG9h4TosxdRnpD
	Of29LLkIFsGm+k3Aw12JvbZuAbn7NbJ8Ske38Fp5J3KumUrTtaOjo+friKr1UkIjDbZVS3nnUfg
	1j+pislBrzc5fXTMmhZ4viHWjXOpPSfavJSsi3gPgE3XgCVKWbkuTttAlesDuGoApwX7LnYefzh
	KgULwAH1ax4YURW
X-Google-Smtp-Source: AGHT+IFU5LPvkb/N/Tw+uEtqevCLgU2MttiUFFLbm7KabFbJpklF9fl5AWplCqLxTcMRubhBHLG45fl0R75pQjr5Qc8=
X-Received: by 2002:a17:907:9689:b0:ae3:163a:f69a with SMTP id
 a640c23a62f3a-af9401b0360mr1300344066b.33.1754389679184; Tue, 05 Aug 2025
 03:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250725100806.1157-1-jie.gan@oss.qualcomm.com> <20250725100806.1157-5-jie.gan@oss.qualcomm.com>
In-Reply-To: <20250725100806.1157-5-jie.gan@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 5 Aug 2025 11:27:46 +0100
X-Gm-Features: Ac12FXyGWj4GgjsQixe5QNRaeCqpVKLMP7WtlbnmlyKxm20j9zCO0LZQIksxx1s
Message-ID: <CAJ9a7VgOTfDHG+nrEUQ5+fxrcCd+ZaWWnxt_F8kavbHP38QCVw@mail.gmail.com>
Subject: Re: [PATCH v4 04/10] coresight: tmc: add create/delete functions for etr_buf_node
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, Jinlong Mao <jinlong.mao@oss.qualcomm.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, Jie Gan <quic_jiegan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_032800_992576_7558B646 
X-CRM114-Status: GOOD (  27.80  )
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

Hi,

On Fri, 25 Jul 2025 at 11:08, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>
> Create and insert or remove the etr_buf_node to/from the etr_buf_list.
>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  .../hwtracing/coresight/coresight-tmc-etr.c   | 65 +++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-tmc.h   |  2 +
>  2 files changed, 67 insertions(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index b07fcdb3fe1a..e8ecb3e087ab 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1909,6 +1909,71 @@ const struct coresight_ops tmc_etr_cs_ops = {
>         .panic_ops      = &tmc_etr_sync_ops,
>  };
>
> +/**
> + * tmc_clean_etr_buf_list - clean the etr_buf_list.
> + * @drvdata:   driver data of the TMC device.
> + *
> + * Remove the allocated node from the list and free the extra buffer.
> + */
> +void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata)
> +{
> +       struct etr_buf_node *nd, *next;
> +
> +       list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, node) {
> +               if (nd->sysfs_buf == drvdata->sysfs_buf) {
> +                       list_del(&nd->node);
> +                       kfree(nd);
> +               } else {
> +                       /* Free allocated buffers which are not utilized by ETR */
> +                       list_del(&nd->node);
> +                       tmc_free_etr_buf(nd->sysfs_buf);
> +                       nd->sysfs_buf = NULL;
> +                       kfree(nd);
> +               }
> +       }
> +}
> +EXPORT_SYMBOL_GPL(tmc_clean_etr_buf_list);
> +
> +/**
> + * tmc_create_etr_buf_node - create a node to store the alloc_buf and
> + * insert the node to the etr_buf_list. Create a new buffer if the
> + * alloc_buf is NULL.
> + * @drvdata:   driver data of the TMC device.
> + * @alloc_buf: the buffer that is inserted to the list.
> + *
> + * Return 0 upon success and return the error number if fail.
> + */
> +int tmc_create_etr_buf_node(struct tmc_drvdata *drvdata, struct etr_buf *alloc_buf)

This list handle function pair look a little asymmetric. Is it not
possible to change this to tmc_create_etr_buf_list(struct tmc_drvdata
*drvdata, int num_nodes)
so that one function creates all the nodes, and another destroys them.

In the logic that decides between using multi buffer or single buffer
you can then use  a construct such as:

if (single_buffer)
      drvdata->sysfs_buf = <alloc sysfs buffer>
else {
     tmc_create_etr_buf_list(drvdata, 2);
     <switch in avail buffer to drvdata->sysfs_buf
}

> +{
> +       struct etr_buf_node *sysfs_buf_node;
> +       struct etr_buf *sysfs_buf;
> +
> +       if (!alloc_buf) {
> +               sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
> +               if (IS_ERR(sysfs_buf))
> +                       return PTR_ERR(sysfs_buf);
> +       } else
> +               sysfs_buf = alloc_buf;
> +
> +       sysfs_buf_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
> +       if (IS_ERR(sysfs_buf_node)) {
> +               if (!alloc_buf)
> +                       tmc_free_etr_buf(sysfs_buf);
> +               return PTR_ERR(sysfs_buf_node);
> +       }
> +
> +       sysfs_buf_node->sysfs_buf = sysfs_buf;
> +       sysfs_buf_node->reading = false;
> +       if (!alloc_buf)
> +               sysfs_buf_node->is_free = true;
> +       else
> +               sysfs_buf_node->is_free = false;
> +       list_add(&sysfs_buf_node->node, &drvdata->etr_buf_list);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(tmc_create_etr_buf_node);
> +
>  int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
>  {
>         int ret = 0;
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index 52ee5f8efe8c..3cb8ba9f88f5 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -461,5 +461,7 @@ void tmc_etr_remove_catu_ops(void);
>  struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
>                                    enum cs_mode mode, void *data);
>  extern const struct attribute_group coresight_etr_group;
> +void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
> +int tmc_create_etr_buf_node(struct tmc_drvdata *drvdata, struct etr_buf *alloc_buf);
>
>  #endif
> --
> 2.34.1
>

Regards

Mike
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK


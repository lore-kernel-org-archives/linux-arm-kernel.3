Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB33C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 18:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3aQ3yKkswTs7S/iYzRYJHZ1Z5dQCtJeegu/4/CsFd8=; b=2zSYgyRyDX3W0CcEsZ8hDANOn8
	TS2rJ3M2omDmy/GW5Ocb15fFc7fDxja5YuT4jR5zF4EHVjmc1M+1dDeCh+h6pGpgk7pyd4SuX7kBM
	eETDEs2MpjHdoq0PRQ5lpzxF5sjuA3lVwQIDlrPZPpwiNdn/+5Z5g7bht4ZYA/YB1BkKHFGiZDKAC
	wNQJXYjnsICXkSaD8DBqt/4H8jjBSBC/eOmWNaptbQ0fNakSntL6nN3zr9eOM0i12ULa4WWwHTsLB
	sauD1Ad6DXzljjy9y1NxK5IYywEuYNcBMOBgRp1iLpJh3gre+46UfsIYR413QStfmeWK38EMQQxIM
	Qw2kggQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtV6W-0000000Cft7-12CS;
	Mon, 10 Aug 2026 18:52:08 +0000
Received: from mail-pz2-x00.google.com ([2607:f8b0:4864:3b::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtV6U-0000000Cfsj-21my
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 18:52:07 +0000
Received: by mail-pz2-x00.google.com with SMTP id 41be03b00d2f7-c96739a46acso1137531a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 11:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786387926; x=1786992726; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l3aQ3yKkswTs7S/iYzRYJHZ1Z5dQCtJeegu/4/CsFd8=;
        b=AkAYAmB8JRD3wUTgTgt7TepupfhPV9dPqgt/Qes06tB5P9Cu1K4+RA39PdUBH55F6B
         q1cZm3mh5KqGt4XX052S8HQGNU2gq+h05Ygp/YuDb5Uu66sbUhYGmA+uYvgyDK/t9RyC
         Lzz8IXQvt9MCEHdhnZU1GwBfZOhnHShjB0NjoSc4mpzJGVLGqHW0l34eZ3GNMHCf5KWV
         +W8QzFGqoiF3dlIblV3HboYu1P9gsA94OmpJqNF6G95eCTP8WVfZqKuwtCmffMXi0Q47
         nIZLJiR3OWHocZJsz3+c55WYoym2qYlJcOC81P8p46p/vl2mDwAXU9i1og73yUjaSli9
         lu6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786387926; x=1786992726;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l3aQ3yKkswTs7S/iYzRYJHZ1Z5dQCtJeegu/4/CsFd8=;
        b=ZU0EJWXJhBHdGDWmFTS3Uud6Y/Hts+Q49enO4Qj09qnCg3O/uNcjj9tfcCfLur/v78
         6UM+RucBjbWKlJ8e7NzdHP3joRCdPyOuoErQ0FvsKSYWGuJ43xDe7Usk5w4vZPfC3VD7
         /1eFPi0YF9hAKdFbYCcyHYC8oDAl/RYbWQbCNnEJ6s/Gp25DGvT4b6H3ba/3Rk+UFvv9
         qGaBYp3s3o2mg63thGeYTeYN7NJAybqeQbXtpH4vnUZ5x3dzH4puRv0Vbrv9JxqvLVMO
         63uPIwjhgdALPSDhMIPSgDpty8jDBS5GD0eQfKdwqumgP1SLu1cThfSv6afHmjE4HD86
         mhSw==
X-Forwarded-Encrypted: i=1; AHgh+RoTGZBbtiQwCwtC/8sS3UKUs+1q91YaDdmpAMWNHw5hW+3AQZbQ3k8FmdStilMoYeEELMn8YDz3mcuIC9A/hNzp@lists.infradead.org
X-Gm-Message-State: AOJu0Yydxixt/1mOM7+Mlj31TTNP5DMdtbeJOzqwigJps/y1FxJFwoqy
	lSB+DC6jo6X0fnVI37PzDkY0OGj/9OiBm+FIHv1vr0n9WDEjU3F7BxDX
X-Gm-Gg: AR+sD11tkqShNY01I1T8vQMeqkZNBjslFu0nOo/gPCi3agAErbC9TZXra1VNK4xwtC8
	EnTj219NLOsBL+9FpB5af/i66cbVkBtTM3/IuCBnjTWXh+rbbPSXl8Yvk39nIgwAffihzQDTZ7f
	netEeocp3yKwqC7tR4OGes8kt10KLx6B8LSlVM4rL3gP55kPXEaU2GBVwRnsGL0AbZU1YsVQaD4
	FNyPl8qFwTgYwQmK6sELwlui4m8XXkmcN7j5yNADKdtoHPkazeEfL6Zhm6pvSrp/qH/MOUsYCEB
	vZkS/yUnEqUFDwv/Hv1KTDRypzhUv/7mtvDbqRdENLqxClQRc9oLA9Clqe196tWDQtwFLRhQxqG
	YdNYrMK6Q9aVuHTHQ8QsVuo3m9cCD0vAIeRy/BV/R/EA/KWacbb20vA8kpogyCaiRa+ejJtKTpt
	Q7J8HEx+GvoUpqH5pKEjNX+nyYUrlvL/5y5nMt8wCYvuhBe6p39oMSYg==
X-Received: by 2002:a05:6a00:12ca:b0:84e:2722:5d9e with SMTP id d2e1a72fcca58-84f9c8da5a1mr3553132b3a.1.1786387925682;
        Mon, 10 Aug 2026 11:52:05 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:52::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a58e6c4sm4386298b3a.59.2026.08.10.11.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:52:05 -0700 (PDT)
Date: Mon, 10 Aug 2026 11:52:01 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com, 
	andrew+netdev@lunn.ch, saeedm@nvidia.com, tariqt@nvidia.com, mbloch@nvidia.com, 
	maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	aleksander.lobakin@intel.com, horms@kernel.org, magnus.karlsson@intel.com, 
	maciej.fijalkowski@intel.com, sdf@fomichev.me, ast@kernel.org, daniel@iogearbox.net, 
	hawk@kernel.org, john.fastabend@gmail.com, alice.kernel@fastmail.im, 
	dtatulea@nvidia.com, witu@nvidia.com, martin.lau@kernel.org, 
	yoong.siang.song@intel.com, rohan.g.thomas@intel.com, intel-wired-lan@lists.osuosl.org, 
	linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
	leon@kernel.org
Subject: Re: [PATCH net-next 0/3] xsk: pre-existing AF_XDP TX metadata fixes
 from Sashiko
Message-ID: <anodof8GsDZHZb-S@devvm7509.cco0.facebook.com>
References: <20260810184753.135756-1-sdf@fomichev.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810184753.135756-1-sdf@fomichev.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_115206_563923_5143265A 
X-CRM114-Status: UNSURE (   7.73  )
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

On 08/10, Stanislav Fomichev wrote:
> A few fixes to address pre-existing issues from Sashiko review.
> 
> Stanislav Fomichev (3):
>   xsk: align TX metadata layout across ABIs
>   xsk: honor XDP_TX_METADATA in zero-copy path
>   net: stmmac: skip queueMaxSDU check for AF_XDP

Ooops, this should've been targeted to net tree. Will resend in a few
days in case there is any review feedback.

---
pw-bot: cr


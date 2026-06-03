Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6619CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 09:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b0FwIuZ5pDLAhzbYxcTxm/lAPKiEu/hDBMREzsHSOvE=; b=vl+sV3nKKZvJJC2LHkSeKHir8v
	0bwM9jmatKX8R75pvVeQpKXyacCkba56UtZbBsfyFOp0KXx14cStm6WADQwRm1U35BzurdlcD4xhy
	AvXd0hkH7focQN6lC2z3gRjg1eFhZiS/uWiAtIOart3yYX3Oa4sCqzwOgMbKTPg34iXE9RHZwR8jC
	2v2yefcVFs1h20DHuA2/ETuQgQgSz8R6I8X1870Mty8NNoF1Q1Bm3zZLgxNjXRKDQ3eJaWvf5/wy+
	WWi4T4bJD5FIPB+RehxdJXnAwZfuK3iA2fMklgfLgygVKARZ2WB3rX9y/8qCgv/OJV14FMTTDp6qN
	mrJfOuEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhuT-0000000Ehw2-2eA6;
	Wed, 03 Jun 2026 09:29:13 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhuR-0000000Ehva-0GPL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 09:29:12 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c85ba774551so1177513a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 02:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780478950; x=1781083750; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b0FwIuZ5pDLAhzbYxcTxm/lAPKiEu/hDBMREzsHSOvE=;
        b=EEXLf1VBYmHVAshNkxIlHKVi1LGlfRI07GINvpUSfvjw7Dc8FixzKzE+pbE0nDJekI
         VPO240P2q5zVduVpqGMQYJ+qbP10DPb/Paluv9cvuuUd5ByHCHv0oPuHCCYDgjLHm2wV
         KOxgQV8tTOm17YYNmXTfMQgDZjHlvjqhFt4ytND03PenapziNnBOFpdJ+6PHK1cjDZ7q
         U3Wwr3+wKhGtf2G514yy9WKto4hrkqwg0TF90NEgBUcD5hTHxRaVTcvQ8Sgat6594RuY
         CEwBvZSGMR6iKXeXBBwn9yKnHG0wjeY5mo8GfdFhyx4tM5sk1/kptnNb1wtBU++QcytD
         OjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780478950; x=1781083750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b0FwIuZ5pDLAhzbYxcTxm/lAPKiEu/hDBMREzsHSOvE=;
        b=YiTXq1sARA2/SsRl3XJKbFc39/92TxKtugEMQ7f/wJ3L0ljJnbT9haNKZqfyuSo0D/
         g+H8x7xDIUjhuTSe+AJ1F6SvxP/d007tC70b4pEFkJ7BVXps4pLj5ASzLfc6cHW55qFN
         9kzuXWFRgINkXHkXSjPnRmcU21yUN+KLtM8Fzro0PCBQU5iba41FOORVM/1aAa0Lcff3
         eHhUHr84zhb73LwOYWX5Z8ev0OA6oXoBbKfgnGhSjrDeAdJlwDfN+IlkCBnrr7EuGcOf
         5uOFeDwAr+9BWokYd4ykDd8+1wM7W8YialwXr8p/bpDBNQAEgDqgnC83LIv57huXt8KV
         e8eg==
X-Forwarded-Encrypted: i=1; AFNElJ/q8AiF5RfCUeZfnnlBE/y+l4aBcmK0mce2P89xCJY9/tbXBfNTolcIrI4Nenrfyrj+roemiBd390NcyzDZJdo3@lists.infradead.org
X-Gm-Message-State: AOJu0Yx//DmdLve8WAwDzsYABi6MEOWsr/GIfXSXdDiG04QtTOxqDp3m
	M8xO5qtWjWPYsWiAtEpMEyt8y8hac71cWHe8D2Tog92S3zsf+LPOrQoyvjh3ZQ==
X-Gm-Gg: Acq92OEwSyDK2TjajpMwQfe7xLkIXbSBA+jYzxDvshjODRaEhxdfztc1Ig9FG+05LKn
	uLnlpBy0sKuSrH/31vhn7QW89QudsXQTbwW59T2zjVNer1pjFtLVa6/Ujtr+nL5+xzQ/1f33ArV
	8er8f4zu3s4E1giGA/RkpC1qbvaXX4osgolqxQHWU4+pcUt/t5paMDmub8jMghIi4argYm06u4d
	Q7dALNr5zAGBQAVSbra6E/cb6xbcIlSNbkpUlsYzSDoZ0U6Mm9lrePcW3Ia+Iom1WJ8XLP4S2N3
	sjqQFEcOS4EWccXGnP7tkNH7ncU2H0Szb2wyxCunYYadELC/2dr9lKAVQbam0jaS+v2sdP0T620
	McMXp+d17tQyM87HZkV7BpO9FGMcw1i8VS277LX2h/T/LnPbGNXJJ6maPzTmZnY7Qsg6EbtVtA3
	3yz3OYtU7EvGY6ful1lePV0BDbnnnYAwAaKKPD5p7jJXb4j5646q6ebgmnUZEbsyaOMwHY2mUiZ
	PDlkJ16M96sLg==
X-Received: by 2002:a05:6a00:27a1:b0:82f:38df:681c with SMTP id d2e1a72fcca58-84284e3636fmr2479696b3a.6.1780478950133;
        Wed, 03 Jun 2026 02:29:10 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428288002asm2370530b3a.31.2026.06.03.02.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 02:29:09 -0700 (PDT)
Message-ID: <a9417d76-eb10-4e33-98b6-4cce7bc3e190@gmail.com>
Date: Wed, 3 Jun 2026 17:29:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: spi: Add for Nuvoton MA35D1 SoC QSPI
 Controller
To: Mark Brown <broonie@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260603043551.1062112-1-cwweng.linux@gmail.com>
 <20260603043551.1062112-2-cwweng.linux@gmail.com>
 <bc0f42c0-b85c-4239-93a4-429193338f99@sirena.org.uk>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <bc0f42c0-b85c-4239-93a4-429193338f99@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_022911_101354_0B244F82 
X-CRM114-Status: GOOD (  10.16  )
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

Hi Mark,

Thanks, I will fix the subject lines in the next version.

Chi-Wen Weng


Mark Brown 於 2026/6/3 下午 05:04 寫道:
> On Wed, Jun 03, 2026 at 12:35:50PM +0800, Chi-Wen Weng wrote:
>> Signed-off-by: Chi-Wen Weng <cwweng.linux@gmail.com>
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.


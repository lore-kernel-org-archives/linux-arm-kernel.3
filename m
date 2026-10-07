Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFE4CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 06:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWhmaHnF0F5r9vJ5hEE64oYYoigOB38AGVvirhYDhug=; b=FHPy4ZvJwcVUFCaserUOnPB37U
	R7+WohC81g7qNcUMw7hNNhRiAUY3JgYHyj1Hy2QA2dZyy1j24Ben/BvFLmlTykJGA+4RtR8WRS5bp
	Hbk9hraJKGgDJug3p4k+RKIrHxtrvlUmHZgRRW/VZcdd4z0idor0j18h4k/ClHQG5mHSAeN4hzStJ
	EmpqOxxT3fEZrQ8IBONU60xhsMFupChZkif5NMXQdvzjEWxR9WXxkN0PEf6DCdAqVJkDwGfHbCo/4
	hi1tmy9t6MCTiqEJSJ7rGBnyD9AZIVnLOJlNiVcZvroVaRCJwFFnzVEOVEX98IvBbmCyZKTkWjhkT
	pIHbAtFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xELPo-00000001nWO-29fS;
	Wed, 07 Oct 2026 06:46:12 +0000
Received: from out-117.mta1.migadu.com ([95.215.58.117] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xELPe-00000001nTC-3MHw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 06:46:11 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=XWhmaHnF0F5r9vJ5hEE64oYYoigOB38AGVvirhYDhug=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791355560; v=1; x=1791960360;
 b=R+v6dMdEq78plI5jsqcwLzpz2xPhUainFoQQ0mPwrm6dtaElCXrVI7fmBHCk9SKeLyJUNOvR
 iwZ+nQ0yrGhx6T1xzVGlN/zxew69rnQgKpI+qU9DHmSCfXeu7icJeurMtzI5k5g894QpViKFN5q
 /ZVFufc9kgE0ZJRPpNDL1mk4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 14cd530bcae84172;
	Wed, 07 Oct 2026 03:23:45 +0000
X-Mizu-Trace-ID: 14cd530bcae84172
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bcc04c71f5so4623e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 20:23:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz0Zx+DuFPnjCIMJOsYMSEyIpEynF3xDNpwycBdDkqttko7nbtq/NwTpc40wB5bfKNXmDKXQbAXG2MsrxPDD/EL@lists.infradead.org
X-Gm-Message-State: AFq9FYLAA9hXj7FIiIaF/HXs5DsBENzfnvmx/vKdHpTzb3o5L2/HiKrH
	/c+aC50kTWiRV9pvfSW7imnF0zctOdvojfPRlanCexPbvMfdF5pYDP1cnQA2TxHVx+4+0HJidd/
	93sa/Z41rDvxW50PJWhMe6q+K5EMMrZoqbGfOseYe
X-Received: by 2002:a05:6512:608c:b0:5b8:caec:cc77 with SMTP id
 2adb3069b0e04-5bcca64059fmr230164e87.7.1791343424648; Tue, 06 Oct 2026
 20:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260923180703.3901185-1-fuad.tabba@linux.dev>
In-Reply-To: <20260923180703.3901185-1-fuad.tabba@linux.dev>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 7 Oct 2026 05:23:07 +0200
X-Gmail-Original-Message-ID: <CA+EHjTyUqTzkGErfkvXeUJOpKwmO6AOxwFtUB_-Gtqo756WOvA@mail.gmail.com>
X-Gm-Features: AclHuK-Cmy6M2r-yI92GOlGoRqwijpnzBsQ4122ICX5yj9Fnvw3oxKt091GVXUU
Message-ID: <CA+EHjTyUqTzkGErfkvXeUJOpKwmO6AOxwFtUB_-Gtqo756WOvA@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: iproc: Use __free(device_node) in iproc_pcie_msi_enable()
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_234603_039165_599E6FB0 
X-CRM114-Status: UNSURE (   5.79  )
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

Hi,

Gentle ping on this one.

Cheers,
/fuad


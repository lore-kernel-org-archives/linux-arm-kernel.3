Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9CEC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 07:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dNme8uRIYN0dXbX3fo0hsH8S0MXXz3OARTVkTdVwCds=; b=Uwnylg4ldl/oQRhmh3RYRF7zkL
	tJBwTaO2CEzbufK2EHWVpe+qLZXzH32nIaBm4UfSfEcBJNFHIFzs3TEtYJRs6uVOhvHhoCZ4U1mX1
	OfWNkzjZW/zspgEdXboJk/gmICAKgzh5EtKepqlnagfE7g1UHk/Q2sILWiJ3MsgIMBtnBqc1Gaj8n
	x4sfOt8dwAd6hAb1znvKvA3ZlKI280gxWeTIIVRP5AO53qP2YJVNAwe9y1SEEPb3tvxoAR5OJ5te4
	G6OwpnQ91lyTJWBXRe0QCTI5Nhjv2gbNyGooBsQMYPZxDaSWEx4FbIMAaz9uncMssmNOSHiHCzGAB
	c2aITAag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Sw1-0000000DgR2-42ES;
	Fri, 18 Sep 2026 07:23:01 +0000
Received: from out-229.mta0.migadu.com ([2001:41d0:1004:224b::e5] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Svy-0000000DgQV-1dKA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 07:23:01 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=dNme8uRIYN0dXbX3fo0hsH8S0MXXz3OARTVkTdVwCds=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789716173; v=1; x=1790320973;
 b=azSJLlBY+Ud7Zbrksgh3OGEzgNVPYu6TeLzMhPkuGRywPEpjiJqKNu48dEQr1B6lprapAMIG
 unhqKIj9quN5X52808jZjCSV2J77mDO3Dh7kHj5N6e8tWO479HKw1esg4G/92/7wqVg2Cjke/0Q
 M1uQZZcm0x0yWe6VV3kzPnhU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c4dcba6dfd1dccab;
	Fri, 18 Sep 2026 07:22:53 +0000
X-Mizu-Trace-ID: c4dcba6dfd1dccab
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b83c1421ecso4631e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 00:22:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw+gqcybiy2QSMwihRJ/nOort7eVr7BVM0X2bSvF/aagHkEvRYV4LicnClvWbQU7bCp5B5vPlpLRUPeykNpR3Tx@lists.infradead.org
X-Gm-Message-State: AFuF++nLSMQaPFQC7iG7Z/YWH6o0IRLeo8CUm1KOU29/7fBMvSZ0bzS4
	mrPvA4WBn8W1abLexaYxThp0ldoydK1T6zn6wQp3xic2KWopQ1NxYqtPYA0qcYU+h4pg9OJkDMb
	M5M9REkhy2chVcZ7mPdFB4smz+imUtTkJrU88zhWU
X-Received: by 2002:a05:6512:2344:b0:5b1:ca0b:25d2 with SMTP id
 2adb3069b0e04-5b8c101ffcdmr104708e87.4.1789716168414; Fri, 18 Sep 2026
 00:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260918040214.85580-1-ndaugoing@gmail.com> <20260918040214.85580-2-ndaugoing@gmail.com>
In-Reply-To: <20260918040214.85580-2-ndaugoing@gmail.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 18 Sep 2026 08:22:12 +0100
X-Gmail-Original-Message-ID: <CA+EHjTx8zzvgqj99TKWfRD58X-M8v+hs9358_r_1zZonFNEsgw@mail.gmail.com>
X-Gm-Features: AcwNN1VwD5DsYs2cjOJY92QTdxd3reBSIUtzU8JUmsF3mGfW8sf3G3EvUGgiBaw
Message-ID: <CA+EHjTx8zzvgqj99TKWfRD58X-M8v+hs9358_r_1zZonFNEsgw@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: vgic: Do not remove in-flight LPIs from AP
 list on disable
To: zjamg <ndaugoing@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_002258_609797_BF7B76C5 
X-CRM114-Status: GOOD (  11.35  )
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

Hi Yuchao,

On Fri, 18 Sep 2026 12:02:14 +0800, Yuchao Zhang <ndaugoing@gmail.com> wrote:

[...]

> Note: this closes the primary race (the last_lr_irq node itself is no
> longer unlinkable while in-flight), but the fold traversal can still
> race with a remote flush unlinking a subsequent non-LR node in the
> ap_list tail. Fully closing that window needs the fold side to take
> references before dropping locks (in the spirit of the prune-side fix
> in commit 7258770e5814 ("KVM: arm64: vgic: Handle race between
> interrupt affinity change and LPI disabling")) and is left as a
> follow-up.

This is the same race Hyunwoo reported back in June [1]. You might
want to have a look at that thread first: Oliver and Marc's view there
was that the fix is to take the ap_list_lock in
vgic_v3_fold_lr_state() [2][3], and Hyunwoo posted a draft of that
[4].

Cheers,
/fuad

[1] https://lore.kernel.org/r/aiHrGM1f8czcUby4@v4bel
[2] https://lore.kernel.org/r/aiJi5a3JJ-TbWL-s@kernel.org
[3] https://lore.kernel.org/r/87a4t99z9n.wl-maz@kernel.org
[4] https://lore.kernel.org/r/aiXvwGD1hS6vwLEd@v4bel


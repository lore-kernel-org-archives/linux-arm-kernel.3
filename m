Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2760C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 14:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NHBznU/RKpQgFAQzB7weutwQS0p5qU29+fazNItsqXQ=; b=ZCp8HeTifSfgiHov0TnoTUlBIL
	mqLU6VBrLwE5ckvV92JO1Vjs6C/Kuzf79Z3O6yrLdC7WY66SxVth4jZy+CKBlkbvhHkznjtmI76Sf
	8k0QmPf47CrB3VaZ/ntqvMzdT9aI88K/ibnpa3h/rkwD3wQRWLufiblOZkfuFdz3zum4iwTDZ89kB
	UN51FavSePssmWDI3oltuyxK5WmjAk/iaNenyTN/eQm71NY/8GmF9WibTUEVMXzgfXK8n/MpKxZ/r
	Bei0IdDp0BTCuS4mjcR8gIfbYhXze8n5xKXoHj0hdan/WFkrs+HEVjY+OOEVvKr7egUiN6wYL75UM
	uk+WoHCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8egv-00000002Lba-1FMv;
	Mon, 21 Sep 2026 14:08:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8egq-00000002LYb-1nov
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 14:08:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NHBznU/RKpQgFAQzB7weutwQS0p5qU29+fazNItsqXQ=; b=W7BbiH1evIwpZC0gHHQDOVVOG2
	rUCfrB5C4tU0KPgXZ4f3OzWxrBbzuIDVLYE1FWev9900t5GB2tzQOXS813LOI9yTQoGm1ueQpxf98
	dl3Kum0FF3gf0EYCA7QkVZwzLbFac+Wbz6ulE7cG3ycwoECF1DewrHy4b8vOJM7XdlX35kVXjrtXW
	jvTvhgyHlHquVEEg9vU5wZiMLWBwpH6jZTnhLdBnuIHAF6HV9sOXkyxNDxoB+vFn38xqlheiX5PKh
	hFqm25ddszQGSL/VWIz42yqVuSBUba/G1306uZSd6DCG6wcm007W+ytFewHe2eZFmIZR6An37GiUQ
	RAPYyY1g==;
Received: from mail-pl1-x645.google.com ([2607:f8b0:4864:20::645])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8egk-0000000CNt2-3jQU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 14:08:15 +0000
Received: by mail-pl1-x645.google.com with SMTP id d9443c01a7336-2d94a158dc8so54348725ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 07:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789999686; x=1790604486; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NHBznU/RKpQgFAQzB7weutwQS0p5qU29+fazNItsqXQ=;
        b=VxrlPgnpKWg3oT33IUDLVuiOZfofHrIWwCYEszfdbHSMy6xRe0X8iYUdtDMjkbwxwq
         jArD+9lQr+5xVuf66Y5CQH3j1u4WSWJvnMGlw5leYW9uEY/etYs+7sur5JPImbyzcmoy
         f3U8I52ndbV619lLFuH+tTERqkW4zQUgL75Ex/iECV7CWsKnzdQNRA/LPWAtHESVzTBP
         EuvS0ri2TaHlSusLrJaVRt1XuEVt0FLc25QswuoL2paIweO+iwp94Za0dDlyTqidBOiJ
         XFyKRwXiKlRceEcZe3a/jl9PaDLmupH6MFueZDhCyzfG+RM40M9bX9CtSPyw9YbQhxSF
         R/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999686; x=1790604486;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHBznU/RKpQgFAQzB7weutwQS0p5qU29+fazNItsqXQ=;
        b=qtAQFNDtxGxe19tm8ChENd4O+GNVtQ/aWyJRcu3rPkQLMUjfp5YC2u1/B9KSrH1KoU
         acGI6ob2QYNHcDW+WEqaRKhO1OVDbkFhHNPRKARxvJg8a0OYsN8xIYwJa/5HlqJ6iLap
         VS/HUXi3oTOfxyjrI386QQdvWPnIBX/JV+cAXP9rvSBOlHqJ8upgyeym2DMhCa18ApXZ
         AVLBo4xFHfTQLr+CaXDAlysvRSHh8LYFU+ITWtKn+gFKK7/EwXyj8VD/RSgWsk+435v9
         mmG39R87W4nvLqIQDfI5sIg3jywqCkCU0K90tREWgzoLCIoe7qkH3CaUytFCI6VzVZTc
         p6Pw==
X-Forwarded-Encrypted: i=1; AKwUvBxE7cJODJScUXj7v7PPfrCwNeixOdO+gqeDOZ7vi2W8SZPdKpaWiBf3qTK3tItpMMUga/8mbZiaYlqkdA1JeKrF@lists.infradead.org
X-Gm-Message-State: AFuF++k5K39a/4Dfs15+tWkWtu7lVyqDniwB5Tg6qyW7skDISpXisLzf
	NTEY2kcc1mR4fUu+2lTlL3wYd7H/oYL+mcwvnN9UO1SAPuFcJ+NFklH5xlJk5hMbDIVhP09eLil
	FpJc//WYN4AnnwmWaSTLzvA==
X-Received: from plrr1.prod.google.com ([2002:a17:902:c601:b0:2df:3de3:9186])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1844:b0:2dd:c100:942f with SMTP id d9443c01a7336-2ddc1009bf7mr110453315ad.45.1789999685875;
 Mon, 21 Sep 2026 07:08:05 -0700 (PDT)
Date: Mon, 21 Sep 2026 22:08:03 +0800
In-Reply-To: <20260920034953.19535-1-hppiscas@163.com>
Mime-Version: 1.0
References: <20260920034953.19535-1-hppiscas@163.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921140803.3210439-1-stanleyjhu@google.com>
Subject: Re: [PATCH v2] scsi: ufs: mediatek: handle mPHY power-on failures
From: Stanley Jhu <stanleyjhu@google.com>
To: Pengpeng Hou <hppiscas@163.com>, Peter Wang <peter.wang@mediatek.com>
Cc: Stanley Jhu <stanleyjhu@google.com>, chaotian.jing@mediatek.com, 
	chu.stanley@gmail.com, james.bottomley@hansenpartnership.com, mkp@kernel.org, 
	linux-scsi@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, martin.petersen@oracle.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_150813_666303_FDF112B0 
X-CRM114-Status: UNSURE (   7.56  )
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

On Sun, 20 Sep 2026 11:49:53 +0800, Pengpeng Hou wrote:
> Check phy_power_on(), attempt to unwind VA09 on failure, and leave the
> state flag unchanged. Propagate the helper result from host
> initialization as well as its existing resume caller. Keep the original
> PHY error if the supply rollback also fails, and report that rollback
> separately.

Reviewed-by: Stanley Jhu <stanleyjhu@google.com>


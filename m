Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D6C10775E7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 17:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6hq+sfehTUwcDaYBmOxEPMrx/kSMTzZMUDBJYS3i4YM=; b=N4/1SX/Guy9abDhh1MqMCgnvoT
	qQ7YclIehbd+51lccbSpIwAA3rMDRgxTj5CaHoimyIObpVVuhJR/TGMuQwoqa3hkne8zsnuKlviU0
	07rAk9UBYihC9gnRHEj1AIuezfrLNfR7K2mpPcA2ji9T6p3l9AeiXWjiqHJ4u86WwQroIwmbi7XfD
	3W3UXDlTRI23t3PFXwid/AYe1OzybiCNKuFbOo4u7pQLfGcucdX+5KsL6XddPEmUMnY2pc4FUze35
	PSN1FZEYf4QKfHCOAtgf+HUZ2F5+xO8gVQvkvnSq9/2SyMX93hkwrh25tPJbJsZf73XQ/aqs8u+ox
	GCyd1TxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uLV-000000091UT-2qkp;
	Wed, 18 Mar 2026 17:06:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uLU-000000091U6-2sJI
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 17:06:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6hq+sfehTUwcDaYBmOxEPMrx/kSMTzZMUDBJYS3i4YM=; b=WkTlx8eyjakxtPzRvT20B05dPJ
	72HRt6qE1nsuIyekLgWv8lQjXTPinnXwlTZYnn4HZly36enkpT5e23t6GPAaLLI+aUSxsQaQ1KkNU
	WZwctye9A4l0k868uAvjHuTO6EKRScXbPdFKy+zRryH3IurEj38l4MMo3uHn5cdLhlXxeZTlLVu6R
	9B1wJHMNZ2XcZZa+GozEaacrJ8plGmV36F8cZOq7mEDMQSZu0MeytuOAFQffzJKqzcDdtE3l4kra1
	gQPSywM2UY7gaFT2DpbonOWu98nlU1+l+w44JdX68dSDAlZZDsWe4klbrd8s3Sld9HngxxftNmFnD
	2HZoprsA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uLQ-0000000BowS-3EZd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 17:06:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773853565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6hq+sfehTUwcDaYBmOxEPMrx/kSMTzZMUDBJYS3i4YM=;
	b=NvK93zHK04bN/z1DgmGLQvJG/v/B8o1Ipe4C4Sftnz1jLYkUCt9hfpzkwv0fjYvxfQB8Dv
	EhOkAntmPW1SQGwWHvaMrJUV30eq907Ja1uEML5wMSQZL8jH4ET/NrEYy1sXG24JwEd+LA
	pEtETTxIaQMTngL2cmcYPBDS6xT8nUM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773853565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6hq+sfehTUwcDaYBmOxEPMrx/kSMTzZMUDBJYS3i4YM=;
	b=NvK93zHK04bN/z1DgmGLQvJG/v/B8o1Ipe4C4Sftnz1jLYkUCt9hfpzkwv0fjYvxfQB8Dv
	EhOkAntmPW1SQGwWHvaMrJUV30eq907Ja1uEML5wMSQZL8jH4ET/NrEYy1sXG24JwEd+LA
	pEtETTxIaQMTngL2cmcYPBDS6xT8nUM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-Sjfywz8jMcSdOUDMbTbjEQ-1; Wed, 18 Mar 2026 13:06:02 -0400
X-MC-Unique: Sjfywz8jMcSdOUDMbTbjEQ-1
X-Mimecast-MFC-AGG-ID: Sjfywz8jMcSdOUDMbTbjEQ_1773853562
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7ea0bb20so59722385a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 10:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773853562; x=1774458362;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6hq+sfehTUwcDaYBmOxEPMrx/kSMTzZMUDBJYS3i4YM=;
        b=pXXRnqg5C32/Y/d0odak13IZ4+HNYVZkVuKVIjB2BfsO1AG5E/WBoe7btxCh1ZfTrm
         V1+IwiDCtZzoZDEd65LE5QNShDZr0X8uKWbBk+IqxzcByWCC22TdiN6+Q+KlzZeZFJlF
         aX64gZ5UUAg8jwgdTa/jLaqDJ+4nWb066miOfaFiaPe9xmq0cSwvWIMiK1Dhqa0pJLb6
         e9EVeUZ75KmOO1K78txbz8FcEZRkjr0tZtG54Jvaxwm2ZNFLt7ntAXbI+KOLMifMs1Ax
         Gr6rZsamzdH9CXOjjPS3Mru5noIzlRIZlrCNChl/ycatIN2nLIT1M7VndIYu16kcyUyF
         xuJg==
X-Forwarded-Encrypted: i=1; AJvYcCXPiyHdAXwRaYb+tnKLSuL+a/Y8dL6kP+Ca3orYNqdeQ47IvSlDRG4aeJFhonpPazXdghfogzk2tME8CUgoENNB@lists.infradead.org
X-Gm-Message-State: AOJu0Ywlj9zwC0ExAaoXazvJ8vsFSbCUZwNitG6aP+KLPCxNwdzBjmFH
	3WLRDs173wyn97CKunfSHbz36NDK1Epq+vZqCpoxo3ysswxbwB0YDN87h0dC42tYdf0DITSf9Vk
	wlQqSEH/FoqWf1G67Fl7oC1600H1hgKcSHokE9QwHgqDS5f2j6lUaPV1bdmdIguPLar765KDymH
	IX
X-Gm-Gg: ATEYQzzIVB/HaAv0Ed56ouoQmtjXJAYDTtdV4Ucliezlti650qoARfAjiIAlSSaWSA1
	Djz+ledAWUN3dBCuLegQguY5dsTlped3jN09+VWyyrnaBczHv4O0nPn/xlHTVPg0HJzu1b2+o0G
	dz7cvQP8gtoyysq+T3d2SiiQJtgqoe5qi6E9TCv1yzrlv090ZRgPDul1ogGSFmWS8azL30WBjZT
	2sZCXz7Be2G5Y7gNszXyA5qdiFgmli5WdFdRFGCU5D0HK75b8clWU5UkR7rqz0a4Kq/LTvRHYOB
	n3CahH9zNweHNA6/WiO/GBR+ph3a/kLUJr+WvEu+mbhf7w5/KxhCzkZPCwQ8p/9ObOJjr1h794O
	yLQY5PLrBeZc+j08=
X-Received: by 2002:a05:620a:c4e:b0:8cd:b5f2:3b4e with SMTP id af79cd13be357-8cfad319e43mr605999685a.44.1773853562063;
        Wed, 18 Mar 2026 10:06:02 -0700 (PDT)
X-Received: by 2002:a05:620a:c4e:b0:8cd:b5f2:3b4e with SMTP id af79cd13be357-8cfad319e43mr605991385a.44.1773853561446;
        Wed, 18 Mar 2026 10:06:01 -0700 (PDT)
Received: from redhat.com ([23.25.77.22])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfad167ee1sm261115785a.28.2026.03.18.10.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 10:06:00 -0700 (PDT)
Date: Wed, 18 Mar 2026 13:05:59 -0400
From: Brian Masney <bmasney@redhat.com>
To: Anas Iqbal <mohd.abd.6602@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org,
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
	yamada.masahiro@socionext.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: uniphier: mux: fix signedness bug in get_parent
Message-ID: <abrbdx8jsVaG9LVG@redhat.com>
References: <20260318110251.2412-1-mohd.abd.6602@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260318110251.2412-1-mohd.abd.6602@gmail.com>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dLdz-RSbY7fScCZq5s3BPyB_PD4YTdoJE0d6txNytDw_1773853562
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_170609_028848_CDF708E9 
X-CRM114-Status: GOOD (  12.16  )
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

On Wed, Mar 18, 2026 at 11:02:51AM +0000, Anas Iqbal wrote:
> The uniphier_clk_mux_get_parent() function returns a u8, but
> propagates negative error codes such as -EINVAL and regmap_read()
> failures. These values are implicitly converted to large unsigned
> integers, resulting in invalid parent indices.
> 
> The clk_ops.get_parent() callback is expected to return a valid
> parent index and does not support error codes. Fix this by returning
> 0 as a safe fallback in error cases.
> 
> Fixes: 734d82f4a678 ("clk: uniphier: add core support code for UniPhier clock driver")
> Signed-off-by: Anas Iqbal <mohd.abd.6602@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>



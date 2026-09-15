Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA958C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g9rzR4FHW24jqWw2J2lJ2bk+jLthZKfD8kBK912Z0ag=; b=HYB/bBlklAsebq5iliqhTW4LjQ
	VeW4ip22SmshED4qN4xasH6RX5OMSJ5CBJMco07NK//LgkUSR2E0BZpjPonZLq4DqLzW+ak3zRh+G
	vYh3fP3SfprrZ9ZXhrJmNzsjvyVzEDHeEMp+4yuNMNvVpL9agZ4rpXm+e4m1vboQmkEGNOBUICPGh
	qIu611SZNan8jk1NLbSl35G95lAS46SFTjZ9ZVbzUCXWjVR3897P77h49qLmgfCIKO0FKs9BCYqbY
	eNvOMiegQcqeYDzlYU7DjUg9xnOYJlmrUafPGUJ1wt0syj3AVQ0PGcOtirO6yKFWw57wDUxKYMCBO
	IwyvVHRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6UfH-000000073gM-0Lkv;
	Tue, 15 Sep 2026 15:01:43 +0000
Received: from mail-qk2-x11.google.com ([2607:f8b0:4864:34::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6UfC-000000073ex-18CN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:01:41 +0000
Received: by mail-qk2-x11.google.com with SMTP id d75a77b69052e-52fb76ec395so2543531cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 08:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1789484496; x=1790089296; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g9rzR4FHW24jqWw2J2lJ2bk+jLthZKfD8kBK912Z0ag=;
        b=Wkf5lj2ma2GDMatVQsvvXbBxWC5s/4JaC3gXvKQkK5Pv8wSYCxVfEOTQhj9zzoc3xa
         YWT3OapIvL2hbJQt9pSQHe5mM3ymD0Gq46A68+8X7MUqVgv8JXyKDQV7Yjn2iGzW+6u9
         ts+1rhFlW4j+zjWd8iiYlDfGEEbMxUmWioPK6OvkYuHKd58JLDEydUpP3Y3wAsi6eTHW
         w9f08i2so+hPBqPDHdU7GpZR0td8EGSpxB1Knt6FIdwlHPx1fApfb49XvToCfT4Gyjxe
         on8M+K+xRx8mLb0GIXaN/WihdPGTFh0RU2QUOQIGczdXy5IHK8O3T6ODDtqoG1Jx9/b4
         J8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789484496; x=1790089296;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g9rzR4FHW24jqWw2J2lJ2bk+jLthZKfD8kBK912Z0ag=;
        b=bxZa2z1DJLh5x3wpPPPJULbnQrMGxxnBR43lUfKBxetHSyVaYf8r8BRVy8Vbxs6JJL
         9OstPkouwNK0d/PrkDQG4TLFsjWGuzrbqfd8w19GXfAO87q4+FDTBq19OwGvKHlDLenn
         n+qZZva2XCfeIx4bFD644QKOb5L9HEuEfkbfVzC0WJUBRCikZVZLRF+Dzv5XTR75LBZI
         rPvYfR8mf4kw6yuQ+dkge0SkC48Jwy2KDjyDcdXqydv6VT2ibbOPDrkufJTqjB1x2uZq
         CXh9fYyIikcB4N3ibzLtdyzVYZyWaLZwhAtHDd+voKbTlhhsPLHmfBKHySloM5JQv3m4
         brPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfTKdsEmo8pwJGeBuXaNcBZ0I6UzGLDtwvHzYr7ylrwLyiTCbXk/EoXBYZo0hR2Tr+ujpjENnZoxHTytffs93k@lists.infradead.org
X-Gm-Message-State: AFuF++kskBxeK6SOKqwo5Sk4mIMUmygMrA/+itcFXEVsINCIEseM2fNE
	LIcrpt6ZjybIHL2tQGZw2SHlQ8qzwRLiY6n6JB8MCNn5HtHzCfQ5/otmUCkq9/GlRw==
X-Gm-Gg: AYBFou15IiEVxhmef/pqXnzAHfL1a9/8wTnTi0qge0bwV9+M3nSd9rX5dxNIw3C+QzR
	dKJMiHtp1A8+em1Uf4DP2YfAspwr2H7TFdHwkoBnG+QBWUw+H+s0KBQSPAg+XgJro945omrYoHj
	wAsADiJ1RxQM7xms+198smt+9ToypvJgcKcdtmoD4h1VQggxd0YBhG0LIzgF3xgYuz1BzQdyV6q
	ATWZtk28L9x417iRw2Ow2nloTbeLC9f7sv0SvUarKQt/4yYKkvhA1gsY4BwaXIY4UR/vcw9AL3m
	mo2fvoPlxi327mnAWHnovHSwo8TwTyimo5mLlrWgNq1VITdA5+SAxuKpGSKHufvoMK/YC+7kp/W
	U1jOC4siOFVl55GoBA4HozQ8KglyUvmph0JtxqfG4MC4i7v54Ml2bAGrJLeGOpUyPW9fImDK3A+
	81L60cAhWThlSxbJLSqF9pQhxl5wCTQXZx4b+vivdplx6lL0G19YhoHu9vlqqtOD9a7hIG9Kv+
X-Received: by 2002:a05:622a:1dcf:b0:530:e7aa:ef4e with SMTP id d75a77b69052e-5312626d895mr19384701cf.16.1789484495571;
        Tue, 15 Sep 2026 08:01:35 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53116090064sm34071481cf.5.2026.09.15.08.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 08:01:34 -0700 (PDT)
Date: Tue, 15 Sep 2026 11:01:32 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 0/4] usb: ohci: Balance controller wakeup on cleanup
Message-ID: <c65da485-90f3-4393-8836-3b793047bfc4@rowland.harvard.edu>
References: <20260915012011.61874-1-mhun512@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915012011.61874-1-mhun512@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_080138_639720_147FF18B 
X-CRM114-Status: GOOD (  12.23  )
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

On Mon, Sep 14, 2026 at 09:20:07PM -0400, Myeonghun Pak wrote:
> These four independent fixes disable controller wakeup after HCD removal
> in the DA8xx, S3C2410, SPEAr and ST drivers. DA8xx also needs the same
> cleanup when notifier registration fails after the HCD is added.
> 
> This issue was identified during our ongoing static-analysis research
> while reviewing kernel code.
> 
> Assisted-by: LLM
> 
> Myeonghun Pak (4):
>   usb: ohci-da8xx: disable controller wakeup on cleanup
>   usb: ohci-s3c2410: disable controller wakeup on removal
>   usb: ohci-spear: disable controller wakeup on removal
>   usb: ohci-st: disable controller wakeup on removal

For all four patches:

Acked-by: Alan Stern <stern@rowland.harvard.edu>



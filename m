Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A8B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 13:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mtk55ULm;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rctCRgnd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/hIuaSXC/8qKVAwXvaUJ1vLVQZIbwa7mDnRwYchKUok=; b=Mtk55ULmmJVOk8dFeahtPmnZnX
	JfuCapY0XSoXbCj4fT7VQq+0ujbnJlFxvmahy+ErzlZEIWVIO+y+k7oM2qMODfwhV9K6il2mfhT8B
	s0G3W3SWzuK1ktJ8FWjFsxzLVi/SMDD3g4PZ8WRn7P1UKP8+VtO7kKCJMWLt5UbAQt1OL4RKydc0U
	evNiXIKPthGhYueuoC+ZdOHqW75Sai4miu0tMDj9IfQFsrUkj1aZcA7DbfQWwzTIdk5J3CROJClGh
	OtK4BeB4a2eNvicAOoKjbTXmA583K79O9auV5CjJB7662zZm3dKGtZpjA3crf2cHbpHGyrHNa7DYk
	0OzJ9lrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMn3p-0000000BnGs-1yp1;
	Fri, 30 Oct 2026 13:54:25 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMn3n-0000000BnFz-2OkQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 13:54:24 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so5961675e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 06:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793368461; x=1793973261; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/hIuaSXC/8qKVAwXvaUJ1vLVQZIbwa7mDnRwYchKUok=;
        b=rctCRgndbXodY9w6nuKBz4PN1qFB/t2yKVfwgOG/Nm4t2pvuMtriRQ/MzZD2TOiPQn
         PAsOk5p17gKtfwN79cv57inOBSDBfK3byyt6HE0IgC3Ze30WkhRgs6jsrXCkJ+tVhRAY
         xxiF9X/PzDGZVuZKAUxL/mxawq7FC40q+Z9cVknIdSv1EtiKXu03am2YishUyM6X8+iz
         +D6cVZEJ1rJ1gdRKYLq1yvafvl1d7NiQOuUkDwdN/O7fRxNgDtntTz4aztGVuWeKxQjw
         6S5RVX54bTOQCDw5x6yxF3HKqbD/CUGufp4qpYbos/L0M94daTf56AdF8bmHe8/m+KWq
         G+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368461; x=1793973261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/hIuaSXC/8qKVAwXvaUJ1vLVQZIbwa7mDnRwYchKUok=;
        b=msYh9jWxX94IwpNesbjKDYrIX49EJwKbmKqHhYKDtfFa3yjvQwX66+xcEfyQXf2uNt
         5ssKEjLsBlvF93bY/lQnJYeYqXc9ZiGHChfiwrUOgdhB70fKW7CP+JcwdSU5N/LZezRs
         mO2sb0To+JaOrdbaB8wJuH0P48lTQpaj+C9m5lnquHjkNBk22tKUFCfMCM56LGwtha8k
         zzh2mLqf/+aJSPoLTZ9I2ZUjBNbKSqD7ca8bpEpMjzv5JPtqwiVJp9w6jZwQ9wv3V0ya
         AzZarkxYncrdd0t8H+vNtvmRrcxNZLGXh9hHdrQTQk/TwiwvlidYRfK96oRANWSAxNqk
         t0Dw==
X-Forwarded-Encrypted: i=1; AKwUvBwjdeS863eBaEyITunEeh/inku8KW8ZsJEnN+jCN3gCiz1HyxKbsmerlmb+Iq1IniSpfYJs8e+oF6zCP2LP+wgf@lists.infradead.org
X-Gm-Message-State: AFq9FYKtkrSlpN15a6ucWZ/Fe8BAzLMXU8KaoHKIPCjqEhV7ZhGQki9r
	FNmkEOo0/rtWKg5ETlplO1/Zzyrbo/u1Pkzyguesdb3s4Q3rC8ka1uv8
X-Gm-Gg: AYBFou3zYnC9w2kcpB3iQJ9wcW1sPvc63KnO/nY+jCR4Ul8Atn3O/+anQYZuW+kx9Jb
	UFGbcxWzpjm8yY8j2CMVfZsEkXSrSP8UIeQhkb8M+SE5n4hTR7ZXFw617afiKtKgjDw0feqOCCI
	WedUnWBZiBcKCgAW8d3+AQNcow7R0J+tRvv72D6lDkY6LKiQYqInh8loPRG1JejqQwewADjC2ej
	W8xcBz1ZmXPQ6LmsLumqVq8Q/2cqKOaPvzEvSUBhHVcwJCoNDTXlguXQZzdINNxrwuPISI1CDvs
	3st8qN+Fz4KfRTGf7DRjqtiH/oQtj+0kMFaix15OhoMWJ2xkGJI3FBuBGKUYAIGM+b1CJCpnXwt
	i5XnCVnhofe3I2DAMqwaej65vMLq+jhVNr8x4jRwS54v8jR86SoPy429OM8+bqQ99aXlu0IinvK
	szbgqPhxksOnEVeNXT04UKlq0EGJDAc0XqZb96b9n187jKevCC99Z6zs5VXnpptcMxYjv6HpMTd
	cfL4oablHzedrXAcIBRkhwBG1CtKRgE8u9R9zVnAAKZAtkGPAYTt9zqg5375/EdJBY2VmgcgBl5
	OTyi2P6zoZ1MrHNnhVGRL4F7QMBRDB+MPAg89hciaAPGsxd6zccMnlYl+EGQluIh/f1jTxOBphk
	G49Bh4C/J0OpOwPI50tzZROT3vFrUoacFNEyPpGIeTyRXYBrYeC6FDEhh08I8FjC+iV0=
X-Received: by 2002:a05:600c:608c:b0:4a1:6c0c:ab93 with SMTP id 5b1f17b1804b1-4ac190497bamr46672575e9.28.1793368460933;
        Fri, 30 Oct 2026 06:54:20 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0950d533sm34613455e9.3.2026.10.30.06.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 06:54:20 -0700 (PDT)
Date: Fri, 30 Oct 2026 16:54:16 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alex Elder <elder@ieee.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Frank.Li@oss.nxp.com,
	Frank Li <Frank.Li@nxp.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
	Karol Wachowski <karol.wachowski@linux.intel.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Alex Elder <elder@kernel.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Guan-Yu Lin <guanyulin@google.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, netdev@vger.kernel.org,
	imx@lists.linux.dev, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/1] PM: runtime: change stub pm_runtime_get_if_active()
 return 1 when !CONFIG_PM
Message-ID: <auShiOI6Hmla6XxR@stanley.mountain>
References: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
 <auRb_r8ZSSU-eHZA@kekkonen.localdomain>
 <9207a52e-2d42-4e10-b777-2988e84d7dbe@ieee.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9207a52e-2d42-4e10-b777-2988e84d7dbe@ieee.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_065423_633847_D3EFC74B 
X-CRM114-Status: GOOD (  24.09  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 08:46:07AM -0500, Alex Elder wrote:
> On 10/30/26 3:57 AM, Sakari Ailus wrote:
> > Hi Frank,
> > 
> > Thanks for the patch.
> > 
> > On Thu, Oct 29, 2026 at 12:30:37PM -0400, Frank.Li@oss.nxp.com wrote:
> > > From: Frank Li <Frank.Li@nxp.com>
> > > 
> > > When CONFIG_PM is not enabled, all devices runtime PM state should be
> > > treated as active.
> > > 
> > > __pm_runtime_resume() returns 1 (called by pm_runtime_get()).
> > > pm_runtime_get_if_active() is the try-and-get version of pm_runtime_get().
> > > stub pm_runtime_active() also returns true. So pm_runtime_get_if_active()
> > > should return the same value as the stub pm_runtime_get(), which is 1.
> > 
> > Shouldn't the same change be done to pm_runtime_get_if_in_use()? It's
> > otherwise the same, except that it requires also the use count to be
> > non-zero.
> I think "yes."
> 
> I think the logic for !CONFIG_PM should basically pretend runtime
> PM is enabled for all devices, and they're all ACTIVE and effectively
> in use.
> 
> That implies:
> - disable_depth == 0, so usage accounting would (if enabled) be done
> - runtime_status == RPM_ACTIVE (power is on, no delay)
> - usage_count > 0
> - runtime_error == 0
> - Maybe ignore_children is false?
> 
> This might not be complete (and could be wrong!).
> 

We could add this kind of information as a comment somewhere?

regards,
dan carpenter



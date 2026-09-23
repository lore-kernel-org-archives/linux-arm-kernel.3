Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E62C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aefF/PiYK1b4Z/D8ikpDUgUaGPgIxFbZ+BKtTsI/MQI=; b=tD3qBaVQXcfvobH+XFlaxMIRvY
	cKlIiN39K8Ci+b4ZcVX4+biQ7FIWzLaMg2ifWyXE5WhxolWElIV8Ifp+h/6ITSpK7uDyijge+juDB
	gD3raD+yU9Ho+mB+veAHNwml/TMaozVxK8Kd6TFNMGRYWfbK5aZfo2cK5ExQxM9XTJz+ce9COaHUs
	G/vWEUWbv00zuROMTkJNyA9hsktYJD+bVL5TWsyCmt4nE7dwhHeBtLA3drLgkDd5adeJgzWYOfDT3
	8TbbYTotaIqpDHxs5GgY5Vv0zl9mGL4aFsGNCYnUsF1EZqJF49za0Uf698Rz15hEuJ3DzSUX9KwRG
	USGkuzEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Iio-00000007c3O-3Br5;
	Wed, 23 Sep 2026 08:52:58 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Iim-00000007c2G-1eQ3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 08:52:57 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49e65a8f70eso26885e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 01:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790153574; x=1790758374; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aefF/PiYK1b4Z/D8ikpDUgUaGPgIxFbZ+BKtTsI/MQI=;
        b=GZMCZ6G//ucB/IdbcLA0Y/QtVjbW19htSxdi6rN3aZ3gMS6kU8fwfLCoFz0IqutW+b
         ianZonFwrSyBGTEV33Ra4GBXFQfOsa6bRaDIM3Bl+tTj8oAp57waXPXgvTqOjWIZiie2
         ESy3J5cBSpzmmaI9JDdrf4EDlTVHkH9dnXCNWuZaqMUnbkEt1jrwLHECRvg4IxlTQ64+
         gAHWeo/7C9KjQhgx6agP3CwIW+1FBB2AfaCQxUX5Jqe9Z/sbU5Ep03YqTBe30brOI2VS
         /jjrB5AZfghgdUhb4uAsavVblck3ZGRuA49Z97DDe/2Jvz0oXugcfHb4FyuGfp8OJAeU
         KEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790153574; x=1790758374;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aefF/PiYK1b4Z/D8ikpDUgUaGPgIxFbZ+BKtTsI/MQI=;
        b=Vnq5TrcMNZ5drTVreJiCe6MLijIP0sh7s2ug6GgEqB/3qi0QGzk+u8/7lSRIG3sI6i
         Hi7JkkzY2DcthUQCYeZj8fQthqKQg5Bqt4k/me0jjSUH2EkIvTlgADHOH4Jt5LjpJ4MI
         cdo3C1x1kEmeaqhyFUIrRBkg0HORbO1iA8596MvrfgZCZ736SAgdn2E8G2tIO2bMYv3Q
         AMe65iBT+/r7aAhiY+I5RhVOS6ifum7XpuoWWXFY0Oqy07wJ4DuO2OY0s9THQQ95bJrk
         a+awG9N2SjCoz1fKvN/FFaJSYNYBT3i9z6/FEYSzFTGO0folfLERLFqSzcFv5KjPllgB
         oQDw==
X-Gm-Message-State: AFuF++lhShqHfuYvMsDgxGXkSIUO5GTb7Q0gzg0H/XF6Za6042Q/R0I9
	6HA+t2pkk29aU+VJa19Y5FspyoMWw9TLSj9OT2sDWLYSNZhGdzP4BRum3pQQd+D4cw==
X-Gm-Gg: AYBFou0k/kdTWyBeb1I7h2PXz8K0QrMde0SgXRlPllKFa26rXIVSu29hNvJ4GrPe+6x
	HceGhBMqEBWno8yXTEanKTQTTddAbVbipWArCDlGi+RmPB/fERkS3vNc0qqvP7BI0kx/IohgY2Z
	KrDqBd8Iqpdjg+KLLG4YrE558yILvF4kP5IVIYPrbjqCDfOJA9czLIiGTtlXS5nhIExR83T4QH+
	nc4TH1bLg64jd2xnOgEyXbZL66zxyBBzU8aG4tCd2pned6Unp56THV+owylhlAZZDQ//2HTLtCp
	Q/+gGCCr6nG8T2+WgOyr7nPKefOYriRw/+KoVlU0/2eJ8NQDUYP6W+6UmzUCHLtCW/9F3D10QgW
	BcO5ZQwIkL7UEPUOGtrJ/4ddyaJiCdEZwUrdqZhZV7QbVpAKG+9WhN+3XqnaaKQAMjXd1rhTBYz
	qSrRVy7uVfjCUsYg9a30E7LxkkBtn/U4SIJo3xSY4h5A2DPUt1/JjoyUL7tA1Vb7CVGS7xgNwxR
	phKgW7JFQEia+NtZS9rXn0JONCQqzzLKggGDzQ1aQ==
X-Received: by 2002:a05:600c:35c3:b0:49d:24e2:5454 with SMTP id 5b1f17b1804b1-49fe0c4a230mr735295e9.13.1790153574217;
        Wed, 23 Sep 2026 01:52:54 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde18a8a0sm60265885e9.5.2026.09.23.01.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:52:53 -0700 (PDT)
Date: Wed, 23 Sep 2026 08:52:49 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v8 00/25] KVM: arm64: SMMUv3 driver for pKVM (trap and
 emulate)
Message-ID: <arOTYREAT_JEyp9U@google.com>
References: <20260922131259.2975334-1-smostafa@google.com>
 <arLD1qj8E+tE2MYw@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arLD1qj8E+tE2MYw@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_015256_454219_576D4AA1 
X-CRM114-Status: GOOD (  27.57  )
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

On Tue, Sep 22, 2026 at 11:07:18AM -0700, Nicolin Chen wrote:
> On Tue, Sep 22, 2026 at 01:12:33PM +0000, Mostafa Saleh wrote:
> > Notes about Sashiko
> > ===================
> > I ran Sashiko locally and it was helpful in discovering problems in
> > the series. However, it still shows large number of critical and high
> > severity issues, I went through them and I believe they are false
> > positives, mainly because (in the order of frequently reported):
> > - It doesn't understand WARNs are fatal in the hypervisor.
> > - It doesn't understand that a malicious host can DoS the system and
> >   pKVM doesn't guarantee availability
> > - It doesn't understand the SMMUv3 spec and makes stuff up (eg. about
> >   CMD_SYC CS field it makes up an non-existent encoding or wrong
> >   semantics for the gbpa register)
> 
> Just my two cents here:
> 
> From my experience, making commit messages or inline notes slightly
> clearer against the findings that Sashiko reported could simply help
> it understand things better and mute most of the false positives.
> 

I try to do that also, it helps to a certain level, then the code
becomes too verbose and the comments will be trivial :/


> Otherwise, the number of the findings is a bit scaring; reviewers
> would have to go through the long list of findings to check whether
> each of them fits into one of the false-positive categories :-/
> 

My strategy is to reply to Sashiko on the list to save reviewers time.
But my main concern was the large number of false positives might
discourage reviewers thinking there will be a newer version with
fixes.

> > - It seems to look at one patch at a time and not the whole series, and
> >   as the series is written in a way to be bisectable that confuses it.
> 
> Yea, that happens too. Usually I would add a line at the end of the
> commit message "a subsequent change will do X", which could clarify.

There were a lot of those when I ran locally. However the one on
sashiko.dev does better.

Thanks,
Mostafa

> 
> Nicolin


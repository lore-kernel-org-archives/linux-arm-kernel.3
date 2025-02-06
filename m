Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D43C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 10:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hMOv1jb3VuPjbiScymll9/U6EJUmVQD7oiX7iZhovg=; b=ozu96CDnoyzyuYA33aMUMQWJ0J
	Xy04h9oquGCfdr6jwdROm+O59N3Q5TUN2ORjKuEkUIrohkf6ZaQruhvQUiW28urFQeJUMInG1ljQ4
	vl4WrKY4ymhzq+SJbxtBi92/O5joRm1TYZImnyQpCKDFjBtUkn5JY6/ZMsGnZNC0Tr18Go5iAh2aE
	ZS7Q5rNB69M/0xplSvf4umMatAO71PuejoQuTTga17+nJTVUp16DFSSn4O8At0pL4h2/IpJXT0mZn
	gCKbOu7NMLKBhxeO1UtrIaHDO0Kg+NpBaoi6TcGmiYDqqtpfiqlV4PwNeXiVVJmv+2bc9I81rdL4C
	grnzKjLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfyuA-00000005x02-0Mhm;
	Thu, 06 Feb 2025 10:14:42 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfymw-00000005w4H-1fC2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:07:15 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-467abce2ef9so207841cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 02:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738836433; x=1739441233; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/hMOv1jb3VuPjbiScymll9/U6EJUmVQD7oiX7iZhovg=;
        b=vkSzJ6jPjT4xoJbDsKyaotBdQhtdpjUS9KgUoshxv/gn8RxzbgIqZHDjFqsS3MmuEp
         Z9aNli6CjOTDS4eVtAfDDAlw7oE0h5eJDCvVHrRHIUkFaFUOlF+O2vteHqoikZvDaY2l
         tXBCiboO18+Ve55duAlbQw0Ipce9e/OxcwKzkm/M7iNKDvwpDz9awyH4U6RNe1rZuqok
         vYpGd1LJnu4tTAkPEGIljOR3s482SCJPGlSD1qkF+zbdDmEnxcVU2A2wSTgWrxEGby9p
         uyExGhoP5PX6fSn/6HPlXDMPvYgVQ8bQ61xgOL6ebSHeU+Rd6ZftxXlyhRk0ZPblophv
         7RYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738836433; x=1739441233;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/hMOv1jb3VuPjbiScymll9/U6EJUmVQD7oiX7iZhovg=;
        b=tqVuwvCcTXTnUc/iRIPvYRt17+TzIt/CGSyAsiHe1/3akwC4DKGXFUbNnUI47sk47g
         dUwnTB4EU1m4f16qzfLYCKnzysBCDuQCyFmg9YJKdrjcxpeunQuYlm/IQbyE+BSXLe/B
         7iq4/xKLHBVOkOuvgfchj+9+KoejmZi30SRIRqqM3Xk3/+Uog8F5OjoqpijRmeJUmUOJ
         ZIlWXFscaYm+HW+U+DYC1whoq3qkCBTzoozCaeqDmkMYLCrTtnfemlxHwVftCzFwkWLT
         Fg0j3pBu2XCEe4TqnYmIVPl/lGqbhsNdYye3QgLxhHh1n0bkmLDi5hPlXYZBpujHGfek
         RVNw==
X-Forwarded-Encrypted: i=1; AJvYcCXMZaYKrWkz87QmDgrXP1xkdnaHQ2QhpXINaHDBcjlFLwpwsp4GJ6TpyZ3eUq2UlXF2W7gpYtKSI6tPlRDt+/kV@lists.infradead.org
X-Gm-Message-State: AOJu0YxxGqnEinMjN17ubvsCLWcd/aTzGxl1tESo1X1qASAy2SiQk19R
	c/WiBfd6p0fA+AmdpNS95c3EsoKSRE47k3f+x6XrPI4sD4gzYSk2lDrgbNM5OxwbOSiCJjvqTrm
	BEK7JldzzFF7HOcnGjfZ670vduNgTQlni5q8f
X-Gm-Gg: ASbGncunbq09014jLfIKblNKv9ctsAJHPQFk9EC8xf/yhojZLg8xPccaLHkAnVSSI9q
	r/BLYhJVQ7i6ui7NquLG+FRW1sBEVzGv7ehBbFko8YopOyOz05aCdjL9KmH7VnA9190yT2J4Oa/
	frcjc8+YHDot2u5V60Ir1k8/lWgw==
X-Google-Smtp-Source: AGHT+IH7CMMID4cSHU3JyQA1yD502OP2lyUHARrV2rOUCIgzeExRxsu/yfaZpg4ohoWCS0xMVOFuIEIBlqd1tS63DMw=
X-Received: by 2002:a05:622a:1ba6:b0:46c:7cf2:d7b2 with SMTP id
 d75a77b69052e-470ffb717fdmr2168741cf.18.1738836433235; Thu, 06 Feb 2025
 02:07:13 -0800 (PST)
MIME-Version: 1.0
References: <20250205164630.1706058-1-tabba@google.com> <86tt98tjdt.wl-maz@kernel.org>
In-Reply-To: <86tt98tjdt.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 6 Feb 2025 10:06:36 +0000
X-Gm-Features: AWEUYZlnvh44VeRTCLkSAtqEhkC3ry9OGtsov074CBIdjnCXpvNC5_jNMjMRqCw
Message-ID: <CA+EHjTyFNgQQnDQ6pm2V0gyFrXG3OOmW_9mYDi_bdq79VdqS=A@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: head.S: Do not trap access to MPAMSM_EL1
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	oliver.upton@linux.dev, will@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	james.morse@arm.com, jingzhangos@google.com, anshuman.khandual@arm.com, 
	shameerali.kolothum.thodi@huawei.com, gshan@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_020714_450779_73C27E1D 
X-CRM114-Status: GOOD (  14.18  )
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

Hi Marc,

On Wed, 5 Feb 2025 at 17:02, Marc Zyngier <maz@kernel.org> wrote:
>
> On Wed, 05 Feb 2025 16:46:27 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > Bit 50 of MPAM2_EL2, EnMPAMSM, traps access to MPAMSM_EL1 when 0,
> > as per ARM ARM DDI DDI0487L.a, section D24.12.3. Therefore,
> > ensure it is set to 1 for the host to disable the traps.
>
> But what makes use of this register in the kernel? I can't find any
> trace of it in 6.14-rc1.

I understand that MPAM support in the kernel isn't there quite yet.
Also, regarding enabling access to a register at EL1, without the
whole framework for enabling MPAM, might be problematic. It makes more
sense for this to be part of the work to add MPAM support, which I
believe James might be working on.

Cheers,
/fuad

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.


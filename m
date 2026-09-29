Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24250CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 19:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/SA4mXTUSdd/EzJdx8NSbO7NRihun4BRn1gT/3r8Zi8=; b=YfP8+nNfuj1zJJF9BztMk6wLJS
	wZqtIEfFhJEIZelWsomn1oy+7HMs1NUdIEr6ZKkSambcGaMzIB6JxTYt9BAO477tJ0gRDHNve8EUF
	GO8zTXs5I1/km8IhGQSfDIvgU5hHaqSAvIctoBjzjEk/i3t/IAuxsgOoK+AH/1saQdEZF+ESZwkDo
	sQVdN5kaecfzN/vNlvfOv/Xr1jYlbx/0pt/c7eRZ10HQuGdT3xZDFhfhpT2qtMKGs3/11UaSsKmZD
	wMEjDrlieZkKy80lUvS+ALtcnC7/0o9gJdK6s1g9/lKJUIwrOSHrScVXCauTEnef+tM3t7aYnzw2L
	C5ILwFqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBd8N-00000004L4w-3fqb;
	Tue, 29 Sep 2026 19:04:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBd8M-00000004L4c-0p9h
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 19:04:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/SA4mXTUSdd/EzJdx8NSbO7NRihun4BRn1gT/3r8Zi8=; b=SNmo5xu9ukP77KavJOXtHnkPLp
	V4j0gI7qx1z/uJmv1qGIVjmSzfVc/Tz+Incl3StwfQxwb1DRwX/clREqrsswJN3E/t5PJkbn862E7
	Fyow4TJj69LCUpWdQd8k3a8ZGBJxQvNAyN3M9VD95vyG9GLtkuv06uQHjS/VwLDb6/rVYnZlZlptE
	m5Ep0H5pA078CZxvi/u4s3GHsIiokS0NJImlB8X72fvA3rUO7+naKLEbnLHdK40qZm/MIUumlP+zd
	s8j5cSKkt4m0RFbjDbCvl0X/HfzG7x6F6uIVcb+pLfI6U9GH57dNLxTj/aXg+Lx7yyy7CkQexbufg
	A2ifadFA==;
Received: from mail-qk2-x11.google.com ([2607:f8b0:4864:34::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBd8J-00000002z8B-0388
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 19:04:56 +0000
Received: by mail-qk2-x11.google.com with SMTP id af79cd13be357-939ca12ab70so564768485a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 12:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790708692; x=1791313492; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/SA4mXTUSdd/EzJdx8NSbO7NRihun4BRn1gT/3r8Zi8=;
        b=dx2qGDNRd0+RPIrVIA/7AUgP9Uz1u4DPPetu9VVbvFuoCtl/Dvca59KI+V2VWsCGzm
         bXw4InWNI0iAmzR554wHXxUYdKlwyl+DhnLxFhH1T6o2ZOZywniGxf/JKu1/eWf4ZTlc
         OQ7DBjCyQyrCOPHHfACGdrAmKD/JuL8mgBC8LBh6KqF8X2wjkBZyMevpYSWwagEOvprZ
         qHfieh4heC2ALfV/d8NAOXLpL2pnxdR+cR1Tf7vZeRNdKGypFPUg4bSOm/nzDuelDm31
         Eq21jFWw2wZQEVXKW0yn3oAd/F8yixqlqnCBEKx14tMzEHDjBXvk+otcFHWWLhjwgYzM
         Zn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790708692; x=1791313492;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/SA4mXTUSdd/EzJdx8NSbO7NRihun4BRn1gT/3r8Zi8=;
        b=hXWlyeddGDN+3i4m8lor+GJvY4mp/kk3DhOyqokwvT0K5DBOs/hUOP4fUiXlNEzndD
         69NjLlGUzmERi+4yjmDMm5sfzDVUVCg13wHXylFBN87dAvXL0ECXnKqzNzP5iQjHjBJa
         wNjXngUQMIofnK4jqAYlNbVqbgZKxT7ufoiOdAf/fBKc1nuzsPvN/abd+CbUytb99Zj9
         bgaD0l1Qo5UCB47R4OwZ1be5ocwCo5gNqMnvRH5a31OeG16Hf5wMwrdkNi7McRYeSgxJ
         Ir9GrnFCcSQRFjwwGrcDsgk9K1Ws6YBALZCCUcPeikutvaqjR9XOQjaW/0rKVCMpdztV
         UR1g==
X-Forwarded-Encrypted: i=1; AKwUvBysvY5vyaYKoL6/2XK4S0zxEivVJ1+uVpcJiO22qVw6gIWPIIig9TMnOWBUAhypgFA6w27AxHqNB+Q7/lHyivPf@lists.infradead.org
X-Gm-Message-State: AFuF++lvr1Bmn7zwi6n/+9Kk3B5J3/noeu7yA06EtQs8hN1HdD34rdIC
	O6UOAgntSOF5ic8BYlD1SX1BkFoU2dg5IhlsNcns+wcH21NJrs+eKuDqw9ebHAlV+/g=
X-Gm-Gg: AYBFou17huSPIK3ewuvvUCw8y55Abip47gcfy1fwVdm6dl+4QQPtliLpwLbCREWQl2i
	ur+O0tbEOG4ODROrAMWzVYqmSRNZJ6EINs7ZojkA+HGvGn9wxkc6H2AkL8QsNHuZn1zKTDkonR2
	tzZ720dx4nNwvRCzJAM1RxR/BmPKPH7INpGiVKVrQOU4c5BPek9JNxTr8uwPOfwZwnTGNTTNGFx
	5jcmKJ6G8vbIIt/4yERB9POIOrmaRnwwEh75gYyx0QGOJpLxc9+FIKc7yJsBy3H7TSRT7a+zPT5
	ZeNKZyRxEetBf+tX8+piVld17a+Oh8kRkCIXGsH0OfYkPT+XyxBId4PqRXhiIv43tkesIcmcMKb
	UhX++wYS2uaO7UCQHGwSg4mwsVsNfTcpR7D7dSokJwvNXaS8sovYC0nNT9U1yYai//3xNfge7cX
	j2Jd4FRRsNfelVl7ri7ziD6ieTEtSR+y5lWglvNJ1zD1Km
X-Received: by 2002:a05:620a:1720:b0:93b:d7a1:ba0a with SMTP id af79cd13be357-93c9fa5845cmr105191285a.53.1790708692139;
        Tue, 29 Sep 2026 12:04:52 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c9f503be9sm38271785a.31.2026.09.29.12.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 12:04:51 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xBd8E-00000009pP9-1hGq;
	Tue, 29 Sep 2026 16:04:50 -0300
Date: Tue, 29 Sep 2026 16:04:50 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>, Jiri Pirko <jiri@nvidia.com>
Cc: Sami Mujawar <Sami.Mujawar@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	Dan Williams <djbw@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Catalin Marinas <Catalin.Marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>,
	"thuth@redhat.com" <thuth@redhat.com>,
	Steven Price <Steven.Price@arm.com>,
	"gshan@redhat.com" <gshan@redhat.com>,
	"cedric.xing@intel.com" <cedric.xing@intel.com>,
	Dionna Glaze <dionnaglaze@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: [PATCH 0/3] arm64/virt: Add Arm CCA measurement register support
Message-ID: <20260929190450.GM163130@ziepe.ca>
References: <20260413084957.327661-1-sami.mujawar@arm.com>
 <20260413125925.GK3694781@ziepe.ca>
 <514ddb27-137b-4223-84fe-2152737db3a6@arm.com>
 <20260414122950.GW3694781@ziepe.ca>
 <a1831d3d-af31-4fa7-b107-f4001841f051@arm.com>
 <20260414133525.GA2577880@ziepe.ca>
 <AS8PR08MB680669CBFA9654BC12179D5E842F2@AS8PR08MB6806.eurprd08.prod.outlook.com>
 <20260422124041.GJ3611611@ziepe.ca>
 <arvh6uGzue9yat9n@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arvh6uGzue9yat9n@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_200455_182137_B62397E9 
X-CRM114-Status: GOOD (  26.06  )
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

On Tue, Sep 29, 2026 at 05:06:02PM +0100, Yeoreum Yun wrote:
> Hi Jason,
> 
> > On Wed, Apr 22, 2026 at 08:57:00AM +0000, Sami Mujawar wrote:
> > 
> > > > So this is tying it to the same FW event log that TPM uses.
> > > > 
> > > > I think that strengthens my point this should all be uninform. TPM
> > > > drivers are directly exposing the event log today, but I guess that
> > > > needs generalization if non-TPM drivers are going to present it as
> > > > well.
> > > > 
> > > > How do you imagine getting and manipulating the EFI event log to use
> > > > with this?
> > >
> > > The event logs from UEFI will be handed off to the OS using CCEL
> > > ACPI table. The CCEL table spec update can be seen at
> > > https://github.com/tianocore/edk2/issues/11384
> > 
> > I ment from linux userspace. event log is well establihsed in the aCPI
> > side for TPM and in Linux today it is only exposed to userspace
> > through TPM.
> > 
> > This is not TPM, so how do you intend to give the event log to
> > userspace?
> 
> The event log would be exported via /sys/firmware/acpi/tables/data/CCEL
> with binary format just as TPM event log is also exported with binary
> format via binary_bios_measurements.
> 
> Instead of Sami, I'll post v2 which rebased on for-next/smccc-bus in
> arm64 tree.

Okay, Jiri is close to posting the "attestation subsystem" which this
needs to plug into instead of creating a bunch more sysfs files.

The CCEL log needs to come out through that interface.

Thanks,
Jason


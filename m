Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC37606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 00:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m/3oR+rg;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NNFBZi2l;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TnwgPAKp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=INQpRPx8mbyWzq5yXaQzWIi3Hx/cG/9SMyY+hgzfpfU=; b=m/3oR+rgoqJLJ4CS4TiW3TUfPn
	XDabbA3CiDSvR83y2M+XgEz7CK8ukDF3U6oD39oP/PjM2PA8x5WKmJqYV08XbTt8bA6e7xGJrrA6H
	aDSAfVTe0lQOm6ZfdhxX0AuNzp72fgMHN6MTFB3E+91tPsCxvzn2x41tO+0/vRAwxAtLcwi6dNI5x
	gryHhSpWET0sEQ5DgrV0174j3OcxGHOKCpdCHSOqV4cexbejpyYkSaTWEWhA8PlpMU2BoIcRtEszx
	Wau6gsHJYjOP5tnmUNYDoGO4JwuIxQot//JUA8uDr1bDOpafbL7Qjx3EaQkRnRiHkVwj9XjFhRsLg
	oj28jfww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPEO-000000041dq-0TM4;
	Wed, 04 Nov 2026 00:52:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPEK-000000041cU-12PB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 00:51:58 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RUOb230859
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Nov 2026 00:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=INQpRPx8mbyWzq5yXaQzWIi3
	Hx/cG/9SMyY+hgzfpfU=; b=NNFBZi2laTdbxo85/1u/nINapGie1XWld52p126d
	BkwVEhqNTD/3WKux9QQp+3Nt2W2tpLwM0SNTrUbTejRVbFe+A89etQsAp1g5sBgs
	WZBuuRHJiRazcGWyV5ftJa2r30rZlr/8JIImABcuN+Cq5oKQrnufcE169RAN5rOk
	VdUoRUlEO4/olpjqOvxfzytCQuiAdGjY1qe4OcU41cHaaCsX6EQJ6ycTogPkM8QL
	SQmeRKImqhseFhcmAUTzuzAYJQMn6pWiv5T7s9y4MMo/os1XdrHCaFYeMiIIJPbR
	dlgsJA8sIHvTxWUhwJxpHovUUAkjD+01bwDErlzYor2SGQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhypjbxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 00:51:54 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a3451ea93so175434eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 16:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793753513; x=1794358313; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=INQpRPx8mbyWzq5yXaQzWIi3Hx/cG/9SMyY+hgzfpfU=;
        b=TnwgPAKpULKb7jwVV3jUAphKIOwumkI7PU9mDdORu7eB4Vv+/VoYoAddReIR453CgA
         fjrNXLUUYMbElu6vcBLe98OvPpyJpnxHizvB4Kvm09/dBIdt3I+8JR16kHqAlZDfjUkD
         I20eC7nwagNBAHHfD7l82cXn07ViRumM8YV1ZDdaXZQH5pXCvnDVZ50gNe94opYdte2R
         2NNQSLTymmvlYuLcGebbeZpgAx5/Fn9ObvABPy/8nvkCRTiM3TxwOAfXsWOfRXe85ot7
         GbsOg2Yvif4tbqqQ+dESp5yVhsslJ2DdPGzvDQPt4MTMIIHbbKuLxnCFWBf/nZJPgQDH
         60nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753513; x=1794358313;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=INQpRPx8mbyWzq5yXaQzWIi3Hx/cG/9SMyY+hgzfpfU=;
        b=zOyOYDLkXFUaIbq6CD4Zl3z1V0VMKxWlsFZN5tDH79ci7JEzFaKQcRZkqxnU2nuiC6
         ZZYxpXt9xhguM8dcOwwp3qDJsMjSEUbDJtIubPmY22dkZjxrIuivuOC/xr0fq+ctyn8x
         JZgsYolESb7YMBRjVyP+LuBSWTYYI6o5iORjYtG6qWfzfNgMf/ilryvEdUMOxU8xBPvc
         +cHDlYdxbqv0Ri8IJkYGVXsRtGGr8RIrFzbh25U7wCvLQfeKmuUJzhjhS52MISW8VaOL
         Booo21Ev9ZMKvssxSupWX+PuLqxm9YzlVwzrrNl2ahDT7jKXKemOM3ycXFkCHCVTvkv+
         vI3g==
X-Forwarded-Encrypted: i=1; AKwUvBxhpaIiVk3OG6sVKr5aBfKcZAYdGeaqckvLWON5uyOc+2+IoskigJ+ATMC2gydSmLXr6dSbN3r/ha/zQ0WigPH+@lists.infradead.org
X-Gm-Message-State: APuU4Z9vh2UKQF5rexigYPoSe2Zt6MV38q6r5aFb4Ll+2z/X9qWIzdBg
	4lmTKXvUwBD0+yCdMSj1KW/P+xzvD5Ej6aK/Hcfu0nQgve7kHudJIp2a6PRXX1dQSJbR8B6piJE
	YP3rmp7cjqfoyXvKEh817zz85lFrx7sYWI8hg1KbO0fRihoumxWoNo9dlUXwkiPxV91P2blMpRg
	ydhg==
X-Gm-Gg: AYBFou1tAPLFkx+THrof0wwt2dY6YvVvMvLlXRDD08TDLTbB8aW9+chOF09DqdPVAdr
	1Pocn7wuLRufEfP7FlcCjy5sHx79KX3muBRKwUXqF+a6Ye+nwaDWxSWbsVofcpFDg5vfF60nAmD
	kdVeClC1ScQapCpeo7voVLRtVmoJCIEFdO762qn8SlK6Ytq0cZqomh4gtLNShjZnurliYfJm+x7
	wEo743wd7m1ODADnvpSAch2SDdRIOY+dGH3tDs/COmZMI9/UsFYuWy70rn2Kt5ELNtjbRt6zwWd
	QbckCmMOiTZTuWFRCqQamLIKgFOLonlTHdwqocR/UR3x+RIzLNBzzjHk0s863EH91czpp7Cn4Aq
	ydnwk39RTp6J8z6h8Yd5RDoN1tY2oCOFKWw43p8R43i/LSBhG0S2wXKYAEBpGJ9iGaJIzuZa4Oh
	K3uOuY33bBis1vtTg76FcW
X-Received: by 2002:a05:7300:e9cd:10b0:36a:ac68:c745 with SMTP id 5a478bee46e88-36aac68c84amr5935682eec.25.1793753512929;
        Tue, 03 Nov 2026 16:51:52 -0800 (PST)
X-Received: by 2002:a05:7300:e9cd:10b0:36a:ac68:c745 with SMTP id 5a478bee46e88-36aac68c84amr5935624eec.25.1793753512201;
        Tue, 03 Nov 2026 16:51:52 -0800 (PST)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a67edsm1825616eec.8.2026.11.03.16.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:51:51 -0800 (PST)
Date: Tue, 3 Nov 2026 16:51:49 -0800
From: Ashok Raj <ashok.raj@oss.qualcomm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
        linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
        will@kernel.org, mark.rutland@arm.com, lpieralisi@kernel.org,
        ruanjinjie@huawei.com, liaochang1@huawei.com,
        Ashok Raj <ashoraj@qti.qualcomm.com>,
        Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: Re: [PATCH 00/38] arm64: Add support for FEAT_NMI
Message-ID: <auqBpSIIdRMYXdDG@hu-ashoraj-lv.qualcomm.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
 <atwyAKSnttnBpked@hu-ashoraj-lv.qualcomm.com>
 <86tsm7xsp2.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <86tsm7xsp2.wl-maz@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwMyBTYWx0ZWRfXzlwGH+U46Y4S
 zJt6TNvO/wVbOs9jaKj4HcpURoeJCROq+5d2ad1MdFDcW7fqUVoC2h/b28D2SYoV8KlrQdbs61J
 0Nuzy41jfhcRZ0iv3wB4affVNeTX718=
X-Proofpoint-ORIG-GUID: f4EsDd3vHDmAME8dThlE-kgoyYol40e8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwMyBTYWx0ZWRfX0CuZ2BI5ryRs
 l4ML4FXL2BHzWAUKhmi9S4nQsoduplRlKmJVXoAMkrR3Vpr+tZxSajBJhb/tOsHGrtQyppip/Mn
 AKDAUaAmgT4Gzik4SRiw4KUxMh3IdPf5BvRn7j7HUHjo5EjFQ58ej+Kc2L6WQCPGQKBJ2VGX1bQ
 fQ30zzuI/Tu69MmYZzOk8u8xclnQxDPdOnodoATyl6qEI9Z1uo9m3RD053qCzS1MxSG2OR4sdES
 cUxIvZgRoJJlAoVvPGybYYtwsnX4ZAQASx2GI9k+EPDAqe4KBvzNRW2kUP0WFLVPpu6sTjtuZye
 5HvMdfLFFjnrfrZMofMJeecYq04+VBhEWg6PdQY48T/se64xWY12srJzGcY0lgzQ3aS+ILPkcHM
 309PGDZ4h1T6tHk1OYOVq3smU3F+UbUkR4xy7jcuWiv+dmEK7xnJ+bYw+aqzeDx9kzV8wMJv4xe
 KR71vFr0ZIWViFyKa6w==
X-Proofpoint-GUID: f4EsDd3vHDmAME8dThlE-kgoyYol40e8
X-Authority-Analysis: v=2.4 cv=T94Z3PKQ c=1 sm=1 tr=0 ts=6aea81aa cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7MFEsAuBIBwT2tAUPEYA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_165156_874879_7AF02FB3 
X-CRM114-Status: GOOD (  40.35  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 11:56:41AM +0000, Marc Zyngier wrote:
> > 
> > Hi all,
> > 
> > I am working on arm64 HEST/GHES Type-4 (NMI) support using FEAT_NMI
> > and GIC NMI support.
> > 
> > On arm64, the proposed ACPI semantics are that the Type-4 Vector names
> > one GSI corresponding to an NMI-capable GIC SPI.

Hi Marc,

> 
> I've already said all I had to say about encoding the notion of
> priority in FW tables.

Thank you for the feedback. 

I'll try to explain without tripping over myself :-)

The intent of that proposal was not to prescribe an OS interrupt
priority. The narrower goal was to give platform owners a way to
identify a small set of critical platform events for which we need
prompt OS handling. 

But I agree the Type-4 (GHES NMI) seems to prescribe rather than 
being a hint. Unlike x86, in ARM without the OS helping with the 
routing and setting the superpriority it would be a dead end.
Type4 seems like the wrong model. I won't pursue this further unless I
hear otherwise.

The second choice I prototyped was to just use the existing Type10
entry, it has the usual GSI and is already plumbed.

The missing piece here is to tell that we need "urgent" indication. 

We don't have a lot of room for meta-data, but one obvious candidate 
was to repurpose the ConfigurationWriteEnable bit. Currently the values
are

Bit 0  Type
Bit 1  Poll Interval
Bit 2  Switch To Polling Threshold Value
Bit 3  Switch To Polling Threshold Window
Bit 4  Error Threshold Value
Bit 5  Error Threshold Window

Bits6-15 are reserved and MBZ.

We could borrow a bit (bit15 for e.g), to indicate Urgent interrupt
source.

Proided that we can pursue this in the ACPI spec.

> 
> > The NMI property belongs
> > to that SPI, while its target PE is normal mutable GIC routing state
> > (GICD_IROUTER<n>). This also permits a platform to describe multiple
> > GHESv2 Type-4 sources, each with a distinct NMI SPI.
> > 
> > The current Linux GHES implementation registers the interrupt with:
> > 
> >     request_nmi(irq, handler,
> >                 IRQF_PERCPU | IRQF_NOBALANCING |
> >                 IRQF_NO_THREAD | IRQF_NO_AUTOEN,
> >                 ...);
> >
> > request_nmi() requires IRQF_PERCPU, which marks the descriptor IRQD_PER_CPU.
> > Generic CPU-offline IRQ migration then skips it. This makes sense for a
> > true PPI, but this GHES interrupt is an SPI: if its target CPU is offlined,
> > GICD_IROUTER<n> may remain pointed at the outgoing PE and notification can
> > be lost, or possibly it might fail the cpu offline since an interrupt
> > can't be retargetted. 
> 
> Obviously, the PERCPU flag says exactly that. So if anything needs
> fixing, it is the GHES driver.
> 
> > 
> > The GICv3 affinity callback can retarget an NMI-configured SPI: it masks
> > the SPI, updates GICD_IROUTER<n>, unmasks it, and updates effective
> > affinity.
> > 
> > Would maintainers prefer that GHES explicitly retarget these NMI SPIs in a
> > CPU-hotplug callback while retaining the current request_nmi() contract,
> > or should genirq gain an explicit routable-NMI SPI registration model that
> > is not marked IRQD_PER_CPU, but remains excluded from automatic balancing?
> 
> The question really is: why does the GHES interrupt need to be
> strictly affine to one given CPU?

It doesn't need to be affinitized to one CPU. But request_nmi() seems to
required IRQF_PERCPU. 

I didn't change the default implementation, so I handled that with the
offline callback to retarget the interrupt to a different CPU.
> 
> > In either model, the intended policy is that irqbalance must not move the
> > interrupt,
> 
> NOBALANCING achieves this, by preventing userspace from changing the
> affinity.
> 
> > but OSPM must be able to retarget the SPI before its target CPU is
> > removed.
> 
> Whatever OSPM is...

Sorry, weird spec language :-(

> 
> The real question is *WHY* do you need this. What breaks if you let
> these interrupts be migrated at will?

Maybe I missed something, if current version of request_nmi() can give
that migratable interrupt that's all we need. Likely I didn't set the
right bits. 

Let me know what you think about the Type10 proposal, and I'll drop the
Type4 and pursue this instead.

Cheers,
Ashok


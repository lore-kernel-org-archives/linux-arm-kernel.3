Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689C4606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 14:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q0Ymzhej;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=iPjHFPvp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=msHDOlhh2/6dyJiFjHesX8sOG3GnrS78AZnmwfxUHak=; b=q0YmzhejhqyzRtkJDCIc00P1ta
	iS131GgRZnGfw8aO/q54tPTA4x9Sn9koxS7m6ArDoDd5wA5KVyKDuUPiaMmPqHn/Na8HQ3tuHnQgg
	JK4oBpzVrJIghRMl6gk6/WHzVj7n+oH9sm+K92NuHPxMdqV/axsm2uryTMcxR4uNmqoI7I7ZxPX1B
	9ZWc/+neR7k4vptP+ux4L05aJGoaKaMCkQc0KXlPBiYhC2rarBxq+1uoLKJlIx6MjQurei8epz02F
	0TcjpnUW8nCViH9nr8rND6dm8hmILpHAFItsLiwNfjuSB34Rwof3eBMLX2jp0VScEvfJdThgXQcfm
	xAaVao2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKz3-0000000Cfx8-0mIy;
	Fri, 06 Nov 2026 14:32:01 +0000
Received: from mx0b-00364e01.pphosted.com ([148.163.139.74])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKz0-0000000Cfve-3v3x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 14:32:00 +0000
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6DcJDQ1890293
	for <linux-arm-kernel@lists.infradead.org>; Fri, 6 Nov 2026 09:31:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps01; bh=msHDOlhh2/6dyJiFjHesX8sOG3Gn
	rS78AZnmwfxUHak=; b=iPjHFPvpRjHes5nIOyyVmq7NSX691jm8bNDgFCoF9S9Y
	tC1DdpyjGVI4thxa6jzkfettF4V1aJBLZ9UGeW8JC2mezZkM6h4cbcAwkBLCNdRs
	EQPMdh5dX5crv5f/0Nb4m12uU9l44F9i05au1GyWEhiGSAvQmvC4I8M8e3uOfO+k
	38GDEWbNgVJgde8UZtO2GcVzWZTYLKmQ5q40VM2xmyncNZY5MNg7aubjrBW/O0vN
	5c5QvLj9edxTKe3Yw5Q5+b5R+j02RocbxarAb+aJPFjPXXPFP37kiYVNo9Fu9Irw
	hndA4NLeqAOFQKISzprmic9DM1Pre5CkAVIqGWbGFw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hs3pc3es2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 09:31:57 -0500 (EST)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b3228a3d24so9678377b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 06:31:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793975517; cv=none;
        d=google.com; s=arc-20260327;
        b=TxKCMgphLEnwExoihxNnJDjI/K09+PUdjG3aH6xm7n1sJCgo72hNrN6IYXGvDdeKut
         yDiPF8JLh0BU0Z4+1vE0RWcwjv4kuSXEsC0d5MwC3hrqNnpHXVaCsFTRQOJ9UOTzUMRm
         EyQZr09sS+Qdx74IhLHqpSn09xAniCcHb/bpYiYdqybTDNXsMi32zUJOqMEeif0goMsE
         iXW9x/K/4QgQfcXgVvhsblqA12wk5kThr0vNygk0s4QiC8mPfMb+26CsMR+AavbKKDe/
         ljKQvA9sE+Ozsz1x+JxAiOUKQrGtu6RjPnAs6e6MoRgG+WQYbPF1gRrUTiuYCWaZk5zm
         LlaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=msHDOlhh2/6dyJiFjHesX8sOG3GnrS78AZnmwfxUHak=;
        fh=uxboFKRBMdFMMdbjNXot6P2HXLjb5KZPawQ03LINWhU=;
        b=neaMv7NtYN1+JcO7CwXTfVJph13Gm+IAzpy4ibMT+HyfY/qeDuNxOdmEuCO9Edjpff
         XZNLBGzyzkTHc8AyhdWNwjBFXaXh5jevm9n9E9RDBrmOs/iYpMuAEW+Y46ODxOUB4I/x
         tMsmdsszgp+m6czfyeXgFV8DcWFJkQmru4gNg+ejsHPGblTQa57zJ1ifZ+GY1pbDNdAU
         1dbMUPzKGKLpMfPrx4iT6jROQqpn0ixIXoxhPdtC8d2dafvDMvQcyEX3k7U1TZnT26bj
         DqljGeTD55IW2ozbfJz1TgOEQbt8auDcww384PGlv4cTrhEzKujjXODxr5dA+EZ3zNop
         Fufg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793975517; x=1794580317;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=msHDOlhh2/6dyJiFjHesX8sOG3GnrS78AZnmwfxUHak=;
        b=MagJpTHcyY1zFRYRCe9fi8IZiUPXZ8PHUldJs/yL0XYEJl8PtRxIvi2HM0vlxZuUwu
         gy/iOIxmp2F6iwTutdH3zxpO//mXnPGHgXNA7Y8auQI4FWRi26AUJY9czlfNL1oCD+Qa
         eXEc03QnV0S/SFeWqMQJTWEgxAMD2mqPrnu6Ukhuc8B2N3Dk3suAYaSSp4P/HUz9+vsl
         /yyZuWsxukQ55VQcs3uXe8GR9m71OppUEuQHByizSSaNTx6qZwAw7nC6qHh2A5ET6TjD
         wusSXg44pjg7aQAyIIKcHbjzm9/W3SrWU6Aa9LGpTpCJdj/0GRe5308O1JJ/hOcBsTTS
         OvWg==
X-Forwarded-Encrypted: i=1; AL+hErFBm5CnH2dmC/a5nOwvGapGfsSL8cSTeEfplxlnk/0FaWZD2TSd4Q/zWDoEbiAmM31cjqTh1uib+egTx1ucvuiO@lists.infradead.org
X-Gm-Message-State: APuU4Z/HtfocmwlA7+Zs+6nrd09HfwVv5ukc+iY5519nYZa1uLt4UcuD
	JknAvJvtau3iw1ccBDBD0nD7R8UBz8LxvK3C5Pa/mm1UK6c3BKrUL/ZOaJhZWL1PeYvfQtmMpDx
	ql+8kJjvMLouR/Ihxhe/vMdMAtaop/GpCNQZ2Tp4McImL9BcNoNciZTfNMhw4Tnnck8mRWb600e
	DKJuiQb2ONLkQnAHo3IaqoKZRSGOxnPzpZblxfkajfc/0ND0A=
X-Gm-Gg: AYBFou0qIuh1RhvSoTGwQRkZdvhT+fs95qFUykK5s0ir6txHr8MDnx4AGthGz6/ewau
	PCsvahsXimqIMUnc6XtXiEjh6PxHj/YiCm6aGAc3mq4D5m+F4WlH6VTValfJDjB3dnhevlXE+bK
	YiO/mZkYdvMXgKFO1+lh0ozGwPnxdkys8OsfELGIafKsRijqIszHB8JbmaJ8Mk1rI73x5sHnMQf
	kHCS1V5UrF9j39FpIaNvglUAGBr+hppS+1zltVzF3z60xUulenrh9ek5yyb3psQCYm9wAxF1C3+
	SsBEyu4wB3oKMMt6+P7+ChuGnc0D6VxLow==
X-Received: by 2002:a05:690c:4d81:b0:8b0:e619:7047 with SMTP id 00721157ae682-8b341971c4cmr11926107b3.50.1793975517462;
        Fri, 06 Nov 2026 06:31:57 -0800 (PST)
X-Received: by 2002:a05:690c:4d81:b0:8b0:e619:7047 with SMTP id
 00721157ae682-8b341971c4cmr11925987b3.50.1793975517147; Fri, 06 Nov 2026
 06:31:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-hyp-pool-and-map-v2-0-44a6ca90190b@cs.columbia.edu>
 <20261105-hyp-pool-and-map-v2-2-44a6ca90190b@cs.columbia.edu> <CA+EHjTzSKwuu6L8f0-=1s2XakCXJnM-k89XpagcwjSx6LX6wHA@mail.gmail.com>
In-Reply-To: <CA+EHjTzSKwuu6L8f0-=1s2XakCXJnM-k89XpagcwjSx6LX6wHA@mail.gmail.com>
From: Xuheng Li <xuheng@cs.columbia.edu>
Date: Fri, 6 Nov 2026 14:31:45 +0000
X-Gm-Features: AclHuK_6RKpS_Z72WeT9xcGJ3utDDUr-1LVpo5TooayXqPvbsyqigVFTteqzmVw
Message-ID: <CAPOPQMBG2aoTW6grkCChFxnBt0Q_+BeMkTQkoCGS6xDbssY9Cw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] KVM: arm64: Check the host stage-2 PGD allocation
 for NULL
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Quentin Perret <qperret@google.com>, Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>, Joey Gouly <joey.gouly@arm.com>,
        Steffen Eiden <seiden@linux.ibm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: X1ADiBFOXPolpAymBLuoHWhotuxqEaJ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NyBTYWx0ZWRfXx2opnIj37Xqx
 ucylRiXTmQqza1A7lVHY8PI7VIJuFwhrBN+/YETYnrzMQGqhgp37bTqtd0zkBzHogWSoWJDv8Nm
 0/K7mXbNS8RmO36DVfSsyjQFKvLPLGrjWjaQ44ci24DBguKtbhNc/36lkTTkXdc8Y4ozM14v1Ra
 cmatoOBbkb+JllgyiCPKkoDbcMJyalN5/POW+EQDT72pq5Ywv68AGtF3TmTVqczsN6SxVxgHNzz
 RsGbs61eds5R022PY8/s2fJg9B3cEeQ67/VFLEtBCnIeY+xgFR+RGdh1Vfeb53oS1A3A1i4Eiqg
 0GNVc5oMIMzLTs5xAU/Bde5YqoVkrbvcLRrSsY7MQy2IKTZZyL/D6d6zdmKCs3Oev/058cH4RAv
 oRMmZuIup/9Ud6w0LW8eRZJIReBC1dRkrjOFkZignf+yxlwg1JUmgyOVMn52wkuvqLZA/uwSeOy
 9koQXTGlWzm/PbFMVpA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NyBTYWx0ZWRfX0Ym50vAKJ241
 fxY09XNak+IR8/XVrBhB7scg1X3a0pM52iDsDbmVhpwV3l8kIvDdTrK5P6MCy1+V+4ucmov7eL2
 vdiriodxtFoznXSCx3Y1mX0RBxV52sFSIr+lwjCaPxvR158cQio9
X-Proofpoint-ORIG-GUID: X1ADiBFOXPolpAymBLuoHWhotuxqEaJ8
X-Authority-Analysis: v=2.4 cv=EeRd0/mC c=1 sm=1 tr=0 ts=6aede4dd cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=b_WDY_0Zt3HB6tkVrE0A:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11957
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=10 spamscore=0 bulkscore=10
 malwarescore=0 impostorscore=10 phishscore=0 suspectscore=0 clxscore=1011
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_063159_086650_528F6693 
X-CRM114-Status: GOOD (  11.25  )
X-Spam-Score: -2.7 (--)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Fuad,

On Fri, Nov 06, 2026 at 11:39:13AM +0000, Fuad Tabba wrote:
> Could you drop this patch? Once patch 1 is in nothing reaches it, and
> before patch 1 pKVM init fails earlier on those machines.

Agreed, I'll drop this one. Thanks for the pointer to the guest-side
fix.

Thanks,
Xuheng


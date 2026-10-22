Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1B3606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 00:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n6dSR0WG;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CKTmObd9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i32yvBGc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H/opNow+kHytu3G/NcD0sUoEO+o11bnVvWNwj42+U14=; b=n6dSR0WG9URrOnB98X0wHKt43T
	c3iqkrh6K2N+IaXzuuZXXuU5qiluEiDDNRJ8xyAHIWUEAN6UuOqxFsD6bi1dyq8SaUd64MGeGwz6O
	Jbg4N2laX5AUs6ovsMC2ynvkjVQ6tJOdXzjr416Uwnf6MzJM2QYCDJ0Z9rmJtzosVKGgpFZ9MndNq
	vSS4M4eCQ65FDFsWv0pctGcg3ydfPNYpdac0Gggcm9Dwsepr9Wk2Ds/xEFEFdYb7rrLfpUum9GiSv
	aSZbVb9JDkVgQBVf3NNnEvjLVipbANP8/BrUUd1U3yd01UoEcdE2+JUq9rJsVRDsm8jM0Vw9d/0gf
	05gAY+Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJgik-0000000D698-0KFA;
	Thu, 22 Oct 2026 00:31:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJgig-0000000D68A-3f9e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 00:31:48 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKeOxZ1154665
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 00:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H/opNow+kHytu3G/NcD0sUoEO+o11bnVvWNwj42+U14=; b=CKTmObd9EYBRD8Es
	JW8RP6hHE2nV/jriTWLFK4Tj07MD2YQ/d+k3krx0ltsunPU1Cqkd265kNM9yKAU3
	GEnCNnmIZVqdzmOaFvqwUFGMkR3jhOrDwVbvYrdhKxx40y/3PqS6OEdz4Y1mzA5r
	nc8kaRtBDStzSfIldolLvF/dk667tyPSl7AI/LeWGSrXbgSZl2mpo3K30Ew21v2d
	6hYLTLvPXuNcUx8Ous6bX1zJ4wVog4riLz0NNXpV98/XnWjGQDy4Iramm7tFASVm
	hQQeeHZq2uT1zz50gd3ihZtkQZ1hZa24QON53S/ZDK8f4lAV6Lzg3Nt099ldullS
	qho3Mw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0cv1u9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 00:31:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c902e0da2so491701eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 17:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792629105; x=1793233905; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=H/opNow+kHytu3G/NcD0sUoEO+o11bnVvWNwj42+U14=;
        b=i32yvBGc+TQB5r7OAgq3QfbnrPs+/hRSJKrzqQSEREJjON47dAZNCjKM5jfqc+tffF
         oxKkm4OcatFa21kuLq4K4MTAs6TImDEH/7q4leUWVpx0mc/yeHWsed1Gk/DeF9jtq/Ee
         RhTijxHOSg7tDKXnoithYM6DNNK0oaIIWz3vI7zHCbWUpA9Iy8YDUXOoE1Sm9+piP7KG
         wKBw/BPnwdewYwpuPLvVmL0hL6LUzW62Z5da5mGzFV1NQ3LnhRLzCCfhCIUABRw3w+Bm
         qCD2fVwxrIckHgP7BZfw2m4CoD1J+BLdIkTlD+2WWpDMn1ZfJQTQ31FJu6UxOx9qD2nK
         z26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792629105; x=1793233905;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H/opNow+kHytu3G/NcD0sUoEO+o11bnVvWNwj42+U14=;
        b=NkGV3TBKZMzjFKqUrkcg02jEf9bQiA+d9JHUx2lK3ZSuS3tktF+irOqRNabmLXVdBt
         kavkeBMCbb0X/MUN+pas7qiQ7tK3Roue5c+nJvOJIfPS5V7w2WAxCQTw1avaRjrALK4E
         TGFiWC238d9limkA9rFhDLrn/5PldICHvA37MVCV1dNcR4NMQ6Q7ddzC6UdMojFcj4nS
         IytXTL9u6GCW7MJd0t67G663RG8tOa6JsNmL459jylu+NnASjlW/zb3M7pmRzfMbpPmp
         7wAZ4ZbRCiepK3QWpJQNl7MiVqPhKtH5yPzM1WFxzDl47HTTyfEvDmrlW9HC5o6cCjEP
         8ekA==
X-Forwarded-Encrypted: i=1; AKwUvBxXI7ERHjp3lZ0BZWhkALRgDe6jSXrx3AEbG+C+yk/Cg6aeNKRhTS342s2DYCFmuEv+7Arik3sSyvdvmTYWrsfH@lists.infradead.org
X-Gm-Message-State: AFq9FYLr42qUP3rLPd06Nfk1JLlYzr462lyoKTvYruytCvoqdWsIZiVK
	6yaHjmqInjLugzgLbvYAB+WTRxf4T/Ae/+tlJm/+nOyzE9SnzBOZ9dN1BtcEkEKJSJr4KDmLCzl
	+cTWJpkpgPcxFiM8T22HvGLydvnoTNL2agR8XP1w5AwqDRCeNCxYbH3GNq8/IRNHe9FU87OJ+xr
	WJPg==
X-Gm-Gg: AYBFou1uBN/itUg2U0MC5ucTzDsTDbXcD/msT+gOUNwHBR8xusNoagcE+GV0o2BfKsW
	Ia4tuh3E46Ak8GHJDmJz0QBvzE4F1Jtq3/YC9bzhXA1A9x4nqmaq2SdjYUQxOE3hZ3UiEw1nB1j
	79T0gsLO3HPubNiepnowfhPX1cIbFezwRyB/lta6NnAutvj8qb9iT1F1vpZrg4rJ3eBdcR9XxCU
	tY0ekROcbJkgZHNxlIrQUPcnKoJLWrZ684ACAOdJfyGe8dKyTBkEJJWDLssEKIPdj1QmUrL2Qq5
	CvUdqePLi2d9Wxufkb+t8KzDT9n0qnxzBu09cohbxwXA80yiffvFZlq76ChivADKMXnYi34MPaU
	3qL5zOE+vNRUC3NSMZIcxejC/R+kvMzlEetfD3gu8Bg1EIq//Y1xSeg==
X-Received: by 2002:a05:701b:4192:10b0:143:808b:b178 with SMTP id a92af1059eb24-192f5c29bf4mr1174137c88.26.1792629104432;
        Wed, 21 Oct 2026 17:31:44 -0700 (PDT)
X-Received: by 2002:a05:701b:4192:10b0:143:808b:b178 with SMTP id a92af1059eb24-192f5c29bf4mr1174090c88.26.1792629103886;
        Wed, 21 Oct 2026 17:31:43 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a180ca2sm8819002c88.6.2026.10.21.17.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 17:31:43 -0700 (PDT)
Date: Wed, 21 Oct 2026 17:31:16 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        Ard
 Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, David
 Sterba <dsterba@suse.com>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-efi@vger.kernel.org,
        linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Randy
 Dunlap <rdunlap@infradead.org>, Simon Glass <sjg@chromium.org>,
        Shuah Khan
 <skhan@linuxfoundation.org>,
        Nick Terrell <terrelln@fb.com>, Will Deacon
 <will@kernel.org>,
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        Conor Dooley
 <conor.dooley@microchip.com>,
        linux-integrity@vger.kernel.org, Palmer
 Dabbelt <palmer@rivosinc.com>,
        patches@lists.linux.dev,
        Piotr
 =?ISO-8859-1?Q?Kr=F3l?= <piotr.krol@3mdeb.com>,
        Ross Philipson
 <ross.philipson@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Song
 Shuai <songshuaishuai@tinylab.org>
Subject: Re: [PATCH v2 15/15] efi/arm64: Implement ARM64 DRTM in the stub
Message-ID: <20261021173116.00000df9@oss.qualcomm.com>
In-Reply-To: <20261021233909.GX3008132@nvidia.com>
References: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
	<15-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
	<20261021111115.00004c5c@oss.qualcomm.com>
	<20261021233909.GX3008132@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NrRE4MdJ c=1 sm=1 tr=0 ts=6ad95971 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Ikd4Dj_1AAAA:8 a=j7B8HJC98GV4A_3RkYkA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 4Cx0Cg2RgTwoUOlMwg6RXw7_LhRx7Eus
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAwMSBTYWx0ZWRfX8Waict/c+wxh
 ShiZMdTGEOIuhZzq1SHexs2h59ZgfhsVmu6qZvn/+dPua7JpAIVSUBI2gyi+IiHCp4qGPU2WuBe
 5fnRlQLg+OCT2lTIxwHfQmka3lfr4nY=
X-Proofpoint-GUID: 4Cx0Cg2RgTwoUOlMwg6RXw7_LhRx7Eus
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAwMSBTYWx0ZWRfXxctI/BoHiBI8
 69KfRh5nmpKj4JrNK4d2Yl77N5G23HsAn2ZWQ9+JUiDWWx8nxiyQdVc+BTsyi1bg856EyDHGsSi
 GdFajgB4HNbKtdXCvoLzv+AqfLdngWWoSlj5AwJTmyP3YuoaCMCT29LwyF3t9+qtMdDStdySXMZ
 TTvxOISNs7mV9+OH70Ou9icDfMa1ptmg3+R4t9LeJwxlRDAqtdrAk22DhOe2hpsfrJgssCQcjph
 ptTT2q0lgsUbpqr+qpni8yohDbBmAOw8H0ACtgSJJPF1zcJNHwmxnfHHXmUhX/+ZvPzXsuZLvuK
 WN9dbQWgJCCJNeo5q30AGypcFRr7xqZ6KezLf/qQhFfW5h1/sqa9vabCeTjvL4i00xDcWIGreYz
 R4Mw37B5CfMgO63QQD43PcJcfrfwW+JmM1eNJ0vcLaOIiBfF24t0vLu0mLepkzExCWkci+JBkoZ
 bSoCRJzN/ap+lYYIshw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_173146_961205_5E90325D 
X-CRM114-Status: GOOD (  49.28  )
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
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 21 Oct 2026 20:39:09 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Wed, Oct 21, 2026 at 11:11:15AM -0700, Jonathan Cameron wrote:
> > On Fri,  2 Oct 2026 20:31:52 -0300
> > Jason Gunthorpe <jgg@nvidia.com> wrote:
> >   
> > > Provide an implementation of the CONFIG_EFI_STUB_DRTM protocol for ARM64
> > > DEN0113 >= v1.1.
> > > 
> > > First, it queries the FW for support and collects all the
> > > information. This is needed to compute the extra_size, which comes
> > > from FW reporting how much memory it needs during the launch for the
> > > DLME Data and DCE-owned data. The generic stub ensures there is
> > > trailing memory after Image for this.
> > > 
> > > Then the DRTM_PARAMETERS launch structure is computed using the
> > > offsets in the efi_info.
> > > 
> > > Finally, the stub does ExitBootServices and calls the actual launch.
> > > 
> > > The feature discovery process is deliberately fairly verbose to help
> > > debug any FW weirdness in the field. Enable it with efi=debug
> > > 
> > > It looks something like:
> > > 
> > >  EFI stub: DRTM: interface version 1.4
> > >  EFI stub: DEBUG: DRTM: TPM algorithm 0xc, TPM hashing unavailable, PCR schemas 0x1
> > >  EFI stub: DEBUG: DRTM: minimum DLME data 73728 bytes, Normal-world DCE 0 bytes
> > >  EFI stub: Decompressing Linux Kernel...
> > >  EFI stub: Generating empty DTB
> > >  EFI stub: Exiting boot services...
> > >  EFI stub: DEBUG: DRTM: will launch, selected launch features 0x0
> > >  [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x000f0510]
> > > 
> > > Eventually the launch'd kernel is going to require built in crypto
> > > libraries that match what the FW is using so it can validate some of the
> > > information left behind during early boot. Refuse to launch if these are
> > > not built in and build in the most common ones from the ARM64_DRTM
> > > kconfig.
> > > 
> > > One nit, if the platform does not support SMC then using drtm=auto may
> > > crash on the SMC op. As far as I can tell there is no way to discover SMC
> > > support through EFI. Learning it from the ACPI FADT is doable and costs
> > > about 250 lines of code.  
> > 
> > Ouch. Sounds like a must have if there is no easier way.  
> 
> Yeah, maybe so. I will include the patch in the next version. Though
> I'm not keen on it and I don't know very much about ACPI.
> 
> > > +/* True if SMCCC 1.0 or later is available. */
> > > +static bool efi_arm64_psci_smccc_compatible(void)
> > > +{
> > > +	struct arm_smccc_res res;
> > > +	s32 status;
> > > +
> > > +	arm_smccc_1_1_smc(PSCI_0_2_FN_PSCI_VERSION, &res);  
> > 
> > A function that is meant to check for smccc 1.0 is using the
> > smccc_1_1 namespaced calls?  Maybe add a comment on why that
> > is ok to do.  Is anyone actually using SMCCC 1.0 on systems like this?  
> 
> This is a good point, I didn't quite get all these details at the
> time, but yeah, technically we have to use the 1.0 calling convention
> due the register clobber differnces. The other reason is we can't use
> the kernels 1.0 helper since it is an asm function not an assembly..
> 
> Fixing everything I came with this:
> 
> /*
>  * Discovery must tolerate SMCCC 1.0 clobbering x0-x17. The EFI stub cannot
>  * call the kernel's out-of-line SMCCC helper, so issue these calls inline.
>  */
> static u32 efi_arm64_smc_1_0(u32 function, u32 arg)
> {
> 	register unsigned long x0 asm("x0") = function;
> 	register unsigned long x1 asm("x1") = arg;
> 
> 	asm volatile("smc #0"
> 		     : "+r" (x0), "+r" (x1)
> 		     :
> 		     : "x2", "x3", "x4", "x5", "x6", "x7", "x8", "x9",
> 		       "x10", "x11", "x12", "x13", "x14", "x15", "x16",
> 		       "x17", "cc", "memory");
> 
> 	return x0;
> }
> 
> /* True if SMCCC 1.1 or later in the 1.x series is available. */
> static bool efi_arm64_psci_smccc_compatible(void)
> {
> 	u32 version;
> 	s32 status;
> 
> 	version = efi_arm64_smc_1_0(PSCI_0_2_FN_PSCI_VERSION, 0);
> 	if ((s32)version < 0)
> 		return false;
> 
> 	if (PSCI_VERSION_MAJOR(version) < 1)
> 		return false;
> 
> 	status = efi_arm64_smc_1_0(PSCI_1_0_FN_PSCI_FEATURES,
> 				   ARM_SMCCC_VERSION_FUNC_ID);
> 	if (status < 0)
> 		return false;
> 
> 	version = efi_arm64_smc_1_0(ARM_SMCCC_VERSION_FUNC_ID, 0);
> 	return (version >> 16) == 1 && version >= ARM_SMCCC_VERSION_1_1;
> }
> 
> efistub can get away with this inline asm since it isn't 32 bit and it
> doesn't deal with quirks.

Smells plausible to me.

> 
> > I a bit surprised we don't have a common helper for this -
> > I guess the version checks are often explicit in a particular
> > driver being bound.  
> 
> The PSCI stuff in the kernel is all very early when establishing what
> the channel is and is done only once. Here is a bit different
> since we only accept the smc instruction used by drtm..
> 
> And even if there was a helper we can't really call it from zboot..

True enough. I was just hoping there was code to compare this with :)

> 
> Thanks,
> Jason



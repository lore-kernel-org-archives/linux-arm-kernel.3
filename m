Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB2D606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 16:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lnXdt+b9;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fGBW0L6P;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AFJIijY/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Qwd5IeDpUYoKVbi14CXRmp0vCTcpiIpKFvrCb+PUaQ=; b=lnXdt+b9GCqy2JvTzqsZFXkoxw
	kzJnqL3SjeawhxvYKPjPfzhlAB2ceVn1ka8+VFfBotPagbRWZDNmHbu0RfgrQOb3gJQWTirjKNLei
	4oGE1OhvuEw4DNlhaREi3085dVzvmNpKZKtAho51ZtYMbHvBZNAGvfIi1h+z+I/2ZsCCXI5GlsB8b
	/k1Joalmyqz56FaOLwKm+QiflWTzIBIIUxPJ6zS2YXQlZjO8E4qfzkynD/mAEo7BpmTe4F0Z3OPD8
	Ys7mOfakIAoCitJ1DBiXfWS4coMZQWIps8Be7uQAhlW5ib2kZtx2W0CCDIBAneWBUzf/eFFiUHlaT
	QLR2Mi0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZXw-0000000CTcH-1vzH;
	Wed, 21 Oct 2026 16:52:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZXt-0000000CTZd-164G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 16:52:11 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LGL2U61105617
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 16:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Qwd5IeDpUYoKVbi14CXRmp0vCTcpiIpKFvrCb+PUaQ=; b=fGBW0L6PCB1n3raX
	d/aUhPmemf5kyrJMb2V994vfSQxb8ZW1AUflWoJbMqxkNdQMkyX60NaRpWzwG2ZR
	dyDNPyramva9fABPmwqppOy5x+y3G2Xjpzu+HJAQ8qTdGMQEDtxA5BLJJps0Gfbc
	0RS6PuOx2PIHdwu3bJdDo33JYwkVD1p+N8Eahl+8OsJIsrCWmXNci7Ks5pmN/stb
	gumg0KOS4MOx3tLDNhDJjMnuFbAjLxfI2H6AicbgZ1SvXdgPAikr3eeNDm/5NzI1
	ReUtxdLTy3hBPhb9/wjImsppuSRvPHiJNWyrz7U7vS8e4LyChMQCIA5S5oPDbcDF
	hGURjw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r457j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 16:52:07 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3510d0baf63so2170746eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 09:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792601527; x=1793206327; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3Qwd5IeDpUYoKVbi14CXRmp0vCTcpiIpKFvrCb+PUaQ=;
        b=AFJIijY/DUD2mLNvDDPl9+krQE5P5GYjxU5qARdO5Dg7uOc1MWoYA1hSROS5KJXLZF
         +ZiO3FUyew9Lzz2Fv8n0s8w5Vl8xsKB1rEFEcdc0I4lEqjKLzqLTWyoxo2uNdDiOb8I+
         sgw/c3Q6ohOVvPa9BMT4f8NrP3jemYYjIaFxyQgVM7+JSO3+CIDffsVz/S+KMYW7QZ7H
         p/Ngb+2/PVbYCM4XBK6LxN0ehWYJ1ehIkGir2Tq5vTcOCQd5yoMCORMs71PlryBAfXlo
         ebghK52Ek177YBGAjoKztkeVJRHKH7C+WTooDzPc76LcjkQE+yNGP//7j6aEaqEdYXQZ
         TSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601527; x=1793206327;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Qwd5IeDpUYoKVbi14CXRmp0vCTcpiIpKFvrCb+PUaQ=;
        b=SF1Eidf8pN0MNyTS4Mwom8gI3EqLpT8Gl/N9iZwJ56wC/vNe0ZGvlyxu5Je/coLakT
         lC+oZ6TlsQSufb26HwN68z1iHOmzNJccaT3Pgf2jR6Ly4is/p30EY87/CyIpJc4DLjCy
         HRB0NHRIxAbFrI6mhq9bLHSi8Tra7eb6zXwyscCEvySvZLlLYefgJINglcoS2ijMIxNk
         Gzga+E4g5Bvs6ccdYHxgsQynRoQF62r545bgoIFKk7D4Ri5C9k9AtWeRN1IXMbE/w/DO
         XKcxfBqfB4K21yuXbWRHerADWevOtKccW6V4GFe9PcfhlaVeqxDLkw7Zx1JlRV/xCYa4
         C2PA==
X-Forwarded-Encrypted: i=1; AKwUvBxSY/iRVGZNOFpBvqbY+PcS3cQQtB4wp79Eku6gfjPwbXAw4uB6tRILH9hY7FjQdB1hqBd8yineYkrvzBTLGk1b@lists.infradead.org
X-Gm-Message-State: AFq9FYK6MnGsrbC/6VZySMIabrDudzq2eD+jwM0y5F4v7FBJZhZHe0pB
	HInm2sHrhVxXEPq2JOc+aB1AGrIVbfLA4d60kyLiubpHZr+lLHZ5KevZrJ5hsyq4PcNoQyEp61r
	ZXNg5iKhDxb0TFz8+dgRY9xVfWJEtm8vVs60Jskk1jd9/uwiQBwz75xaDPkf91uEWpOP9wvy7AJ
	vi8w==
X-Gm-Gg: AYBFou0LCpgj6kqQeEE2cjzLSc55jFHdTbpQzk3BOG0hSBiLdu/WqTfGaxJKm6DEiZi
	BV4Kwrwc3gtCmE4rCND+bBCxl6If5/vNDoLnMaD1djgHVaqJocNwYrtxcgRcxr+5yV+PYRcO5Vy
	IyfznoZ0bd8116AreScgG6IErCvKA8ecMXpnHC82b7I+CQDX1Pe4UDqWpJOvQYqP9/+IHLtAHNL
	1FiUao74Lm8HS68r2LAZ01AJfKI9JSGn5SSYy5ODqUwCt9DpKE0Puu+M7isreQiXjWSXsMBflk2
	ychJRovAGnKLurR/t5Pa5La1jHmWh+sqCLXAs94JMygFOjubwRvbRN0QP4FckBm0fySwOZW3SxP
	ez1YTVnZkYzBnp5/C1pmZR7goaG5SGWUsjLWti/CPQA==
X-Received: by 2002:a05:7300:fb83:b0:359:8492:2107 with SMTP id 5a478bee46e88-3674c43c286mr5506650eec.10.1792601526897;
        Wed, 21 Oct 2026 09:52:06 -0700 (PDT)
X-Received: by 2002:a05:7300:fb83:b0:359:8492:2107 with SMTP id 5a478bee46e88-3674c43c286mr5506599eec.10.1792601526326;
        Wed, 21 Oct 2026 09:52:06 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674206d1f1sm8700283eec.28.2026.10.21.09.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:52:06 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:51:55 -0700
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
Subject: Re: [PATCH v2 07/15] efi/libstub: Add generic arch callbacks for
 DRTM
Message-ID: <20261021095155.00003fc2@oss.qualcomm.com>
In-Reply-To: <7-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
References: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
	<7-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad8edb7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=PZHjKiIRVRR-A8qzlogA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 6gmiyxSuszU9fYr7Jn_KFJbrHF3LMa7T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfXxGg7Ug6YLNDj
 fZMQyHEXnEU2UJpVWQQ5xSY0+GKqfVO4ZOqCLS+bIPmVMKw76tiHj2F9+L7sRlnsY8UWkaatxCj
 viqmfvNO3aw2/F5qvgG5Y9Bwf+ytRwQ5lHCKmw2a9g5nDx72HaYHffuYlU/1kPDkfpXyjHDcN/N
 3T3owZiIYcX3IjhEmu840eFTZT0riTDPOV7wu5W4DdGNO75GTqKmDpRHzj/MlmLE8bdu2r5N9rw
 A7YlZcyg8Gc35DFiibRYqKmC/qsC1ROZR+xgPG2Tnlas2ryskHe7bKzrLvvgWZRn0A37rHcM3Xy
 3RoAwQN5lKraoZML38SZRZLPrMZXJszSRSS+ZHO8ukbD9AThwFLSPlmLnt2ht8D2BVaxFcWjUKg
 OE6ous5nOH9w5/HoLVwDsSrAXsVTevHtI9Sa101i1nrA0yrmHlV/DJvX5+onD2dFdysIUlwyIs2
 NpPEqpnu6YWLK2op0sA==
X-Proofpoint-GUID: 6gmiyxSuszU9fYr7Jn_KFJbrHF3LMa7T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfX0fBeBiHMHV+a
 898a34Pn9b1zC2QUeuao7nwkg/j437r3tg6/9PSuN/PeQYnD1f70RFHtKC//Jmb9OCzTm9GfW1k
 FN7raoVHeCF5IKCIiHpIK+LFpJWnRmI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_095209_453578_9493FD0F 
X-CRM114-Status: GOOD (  22.88  )
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
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri,  2 Oct 2026 20:31:44 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> If the architecture supports an EFI stub launched version of DRTM, it
> can select the kconfig and provide the hooks under its architecture
> build.
> 
> Have the common code parse a drtm=enforce|auto|off kernel command line
> parameter to set the boot behavior. Support commas in the args list since
> there will be more options here down the road.
> 
> efi_drtm_prepare() is called before doing any decompression or image
> relocation. It should figure out if DRTM is supported, policy-permitted,
> and how much memory efi_drtm_get_extra_size() should return.
> 
> The image handling is revised to allocate extra_size at the end of
> the normal image. The architecture can use this to store any
> information needed for the DRTM flow. It is always contiguous with
> Image, which is a requirement of ARM's specification.
> 
> efi_drtm_prepare_launch() is called while still in EFI boot services after
> Image is fully prepared in its final location.
> 
> efi_drtm_launch() is called after exiting boot services and must
> jump into the kernel through the DRTM flow. If it returns, then the
> normal launch is tried (auto mode).
> 
> The extra_size is allocated directly after the Image. Handle the
> trivial zboot flow now, and vmlinux in the following patch.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Seems fine to me.  Some of the functions affected have annoyingly
complex flows already but this isn't obviously making things worse!

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>


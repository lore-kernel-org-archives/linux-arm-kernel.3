Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C70606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 06:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xx5w0f7U;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZF160nBl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R3KKxFO9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zueH4EHn/lD7l9x2yjdaQYpbQCvXUU5hvsdEAPTBPQI=; b=xx5w0f7UenvK9G
	fK+ClV31E3oYM1vEjoJ3/+JdRZQjs5l8x4v8SPDUBRMBtDFTZeiAMWNFUUAHrkv+0NFcJf3cmr8qA
	gEZsRc8prL1dgXjyh/4jaaBmxjAPgQqAatcFkPs466ayH2o7s2miD62VHJ5oOkkErDvfH+OZo2eb7
	U18jWej3/yvHduSH3uH0IQRBTVAj4XHoG/t51piR8QI9lflpUplTnGFUVcvs9M7zL9Rb1CE9I/zny
	oZHRLhwsWbRRc6n3mHOaMPSmOp4eqtPXW7dI7zoS+Odl1AOKyOVC97C9flkIJFMzxdChKCzi+wg56
	5erALckWBwDRIm5iuY2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlEP-0000000FcyH-0LP7;
	Mon, 02 Nov 2026 06:09:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlEL-0000000Fcxu-3zW7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 06:09:19 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A24CYRK1811485
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 06:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zueH4EHn/lD7l9x2yjdaQYpbQCvXUU5hvsdEAPTBPQI=; b=ZF160nBls992pB7m
	oVZcOD1SOxpQ4fAPh5X3Ns3oYFTa77lximGLGfvjk4rT/SCSPZ4EBKOH7E0V7Ixh
	mo+O/qdY61Vak3aFHJRg+rqqXnJaI9c0uaPp7wqKbd4Lwmekr0uTT3KMRgQfy3FY
	b2fkBZJ+E402ahWYQJzC9ERlJEps/o6GdPi7CbligQJjgLofmWGjzLSZMJOsZl1L
	7I0+mj9lUV7A8cHm5IpEp0cTgYokMaMx8hxSNjiFPlOrCqbgK57fuiqrCdClvHDH
	qhveVHJLEN8J7ks0gLe2rzaC7v4MqLahUQd83ZSbk/Bq8ZtQUNX+70e0bKpjBqdU
	n1qbJA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rg9we-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 06:09:16 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8ab43f7f5faso46178397b3.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 22:09:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793599756; cv=none;
        d=google.com; s=arc-20260327;
        b=AXpvyRbFZfcZZFa4aidRPmeTRDhhfEMIuNEURDbo/547gPMBLstfOdaUpr90iYTMlz
         o5G4iN9FzVpoekBSTHFR71BfkeNtz14XW97Ceqxpo/p6M1kVDdQSFpi8IqlNdGis+W2n
         KRpTRlixKI266puyVKoXNUfISTCyvm0lCdgTQoVPE9s25y+mDNhKkaWp41RfbEHPHmqa
         C9rB9CtbDhdbnk90u9fsMg1dJutSOovk/At6xNz+BDwZCgFjyFGbmfDROX2A9qvnA5RV
         tdf2veKWMNMXavAeONTBwr8pL8PnJDG+paNSkP9hLbcNf+ZgFrr2WADyBN8YmiJ5RlWJ
         Mrxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zueH4EHn/lD7l9x2yjdaQYpbQCvXUU5hvsdEAPTBPQI=;
        fh=uDFXe6f1AYrr1beOXhxzp1H0CSgpzBMt0CZY2Y541fo=;
        b=EdVUQqLp+GFgpJFK4nnFQJ8u2p8bYZUxXteRis7m8YjL24SobwftFkTqE8k+vL3E0U
         q82frX12DRkIYGX4Wd9eXMuG4OOd0hI8VmfFp2pyShorOqLcqyQ5BPG57jCYxC3pWUD0
         q9QWeOzUyKpX2MuCkb6/v/W+VrnCjlyZzSMI7JNWjdRi7+PcTPTADqIsOysCFo8fuO47
         MbuF6ZCg5iMYDF31LX3Wdx7L7LxuwoGs6Cte0kSQM/L+sdVj/WuZym1AyZrNXNEtpNge
         Aupbize80U8ttZ9p/QItsYnBdPq6G+Pr3N/Oj1X7vuxCoTrNRrD/YZUnPJqgKLm0tWFV
         lIWg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793599756; x=1794204556; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zueH4EHn/lD7l9x2yjdaQYpbQCvXUU5hvsdEAPTBPQI=;
        b=R3KKxFO9SlTepu4E2CW5ZqOzZaIVHLhFxNOjvnEHUj6Ea79T7XvDQINHSfkjmYY0Ic
         cxdZK5L37blvPKQn/dRkczcClyt20y8SiUGnkInNa/Z+go/g5yc+O/a7DtrkLhokQUJO
         NKwlYHIqlC5X3yOvb+drVNT0ShNPCenz8T1JRV+3npYNqsTIxSIYrse0dG8IPzJ76bGa
         QjKf/6z3jo9oHZwua6CQUBXPuA064AAldEGKE6r4AsxgApS68D09+ij/dV9A5hgVzVOQ
         Cst9WzrsYhZ8anU+DtIE5J+V/QUAHrOJvh7yBnG5tWGXPrc0Aicw8arfm3diTGQsnCnH
         9mYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793599756; x=1794204556;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zueH4EHn/lD7l9x2yjdaQYpbQCvXUU5hvsdEAPTBPQI=;
        b=O+N5ACHeZIo3drXf2M+8vNodd5WKHZMObxA6AphLR2jqSLd5PsbMbk8HO/uI1qtNSM
         YntnsFdwUzD/bTrQYcneZ6hyz/vNY2KWKRYFRGZT15WjtvPIwhM0kkujLm2TQ/XAgMP+
         RY43wwaFVSMmrV153RJuJkKhsJCDC7VxfvvhUG/tY1Tm1sarAO5VjMKC7TyZGN9n+EoS
         9hpLLzk4Tandcafjb++tT9fauqBdYJu8h6gIFxQhs4Jj1opLkE3VdXH0b5KgiV0fJNkl
         4SbkJhwIJET3j+i5kSm16wsLyCvF3DCY3kVplXyJJi/tEorZ7sjmTGXN0aqaow5oEfaw
         BEtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQuErJH1XJ5ZbgG8RQsTBv30VbGAhZWR8liTddIRQxXloWT1VNvfsUw1+bmx0cvHm8CeuBjcJD16m9Uw4eIzhB@lists.infradead.org
X-Gm-Message-State: APuU4Z/Wl/2MFSlJMhppw/GvEpl6JuSIeV3TSLIxZ2yD7tzwl7hAdkaL
	yIp3TiYVRuYop7iDhZ/ft3zdN7bqtMWvr80P6sSY5AdewcjVWX9pj0R9BZCuh98mi8CaASOylAy
	p0MmnvGSgMi7ikTkDvD0x9td0Mzk+gcpmsG2xG08MmNwIzUzSeemuVGlRMt8eoJE+keCMWhr+VA
	94MZ8qT5Vq8X+ETLJYXE1gS7NDxyxq3Xkb0XjWgyoLr9hBRgsppWPinpXli20W7H8=
X-Gm-Gg: AYBFou2fPejvGDhIrAHtdB9ZgcMwCFyWB3VpNIBMcilySKTscd0XzfHnbh3heCHeXlL
	bx3V2Z6ve0ulqjS3QYc+gqqv1fYt8UQoipGr+u8bGSYPqcq6LqJV6fBKMsWlYnHDpXE8dw/R5pK
	ztkTeQV928LX6wu2aXdD/gvT9S0VSbGXA8Z1Sq2ar1HcismC4gRR6EKaMmAQ==
X-Received: by 2002:a05:690e:4594:10b0:673:e272:f3f8 with SMTP id 956f58d0204a3-67ba4c89334mr3369647d50.20.1793599756025;
        Sun, 01 Nov 2026 22:09:16 -0800 (PST)
X-Received: by 2002:a05:690e:4594:10b0:673:e272:f3f8 with SMTP id
 956f58d0204a3-67ba4c89334mr3369635d50.20.1793599755206; Sun, 01 Nov 2026
 22:09:15 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260922130653.357615-1-andersson@kernel.org> <04be768e-7c38-4ca6-a721-d716947b8708@app.fastmail.com>
 <CAGptzHOaNfXhDf7pZ0v=nKGXE6UjwOaw4pacPA4y9Lop8yP37g@mail.gmail.com>
In-Reply-To: <CAGptzHOaNfXhDf7pZ0v=nKGXE6UjwOaw4pacPA4y9Lop8yP37g@mail.gmail.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 11:39:04 +0530
X-Gm-Features: AclHuK_ZGfEtpfZA1498jVLU3PJS-3rP5e-VPIRkigYGxV0PkiHkLUhpOvX20yI
Message-ID: <CAGptzHM-FgeDuaE_xMT2FNJrN5y=8L=FmdtoPs5tELNXZ20CRw@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm driver fixes for v7.3
To: Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>
Cc: arm <arm@kernel.org>, soc@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: V2E42jbY68B5BY_BUnF4khQpwxkl2tQ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyNCBTYWx0ZWRfXzdUX0ceJefpA
 ZvxAnCglHmYx2UtK4xrvB48XhMArGYLlNUbjlv8sSRiwlFDz7m2Ocfw53eJs3koRq1ru2ZrdUGi
 8OHZ3uSrXxNqGO0eqfhZ0p5rheQltbg9dLFZRF0TDMUxM9ORyMv37ltAz5gQXEjekY3FYHR1hxp
 N6w9WPLcpWrUUlTBLgMnU74VpbxrRexBeQFbqXwqPxlYlJAdN5mnuumFTFuXgCuVmxUXBBkrLYh
 LQURgUgYblZVkkFG6FX1yF+mHozyjyNx7/FlSNXTcK5u/nqo19Y+zHVmmCBWkU6qEBZSe+WnviK
 m9xsBJQYw/62Nr48NuxKS37Z67SuqOLJVmtsprE3co95tzAcN2Sp29yi9iNct3VLYI18sKH3el8
 V/rAONK9sYlm2UsCDbMBxugFyiJljbTNIU/OglwzHK+UeeK33OtIiUhJYSlL7gLMHm789v/60fi
 WWS1CLupUDSs/fXBf6Q==
X-Proofpoint-GUID: V2E42jbY68B5BY_BUnF4khQpwxkl2tQ3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyNCBTYWx0ZWRfXwCaUc6rZCqRW
 9KwYpB2T+S7JNle7gQqF79i1zyIT4+XglrBO+ta6syX2ivFiNOnJ2btPru/Bg+BCWavYkMs86fz
 MOtPidAwKnt9I1d9mOTcUUbL9j2DNyI=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae8290c cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=kdkvEyMxHJgC4A9uITsA:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_220918_004679_13DD0A44 
X-CRM114-Status: GOOD (  26.27  )
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

Hey Bjorn,

On Thu, Oct 8, 2026 at 10:35=E2=80=AFAM Sumit Garg <sumit.garg@oss.qualcomm=
.com> wrote:
>
> Hi Arnd,
>
> Coming back to work today after vacation.
>
> On Sat, Oct 3, 2026 at 3:07=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrot=
e:
> >
> > On Tue, Sep 22, 2026, at 15:06, Bjorn Andersson wrote:
> > > The following changes since commit cee9395acd8043be0644b25c34bfa86623=
f2b935:
> > > ----------------------------------------------------------------
> > > Qualcomm driver fixes for v7.3
> > >
> > > All clients was migrated from the Qualcomm SCM PAS API to the Qualcom=
m
> > > PAS API in v7.3, remove the now unused direct API.
> > >
> > > ----------------------------------------------------------------
> > > Sumit Garg (1):
> > >       firmware: qcom_scm: Remove SCM PAS wrappers
> >
> > Hi Bjorn and Sumit,
> >
> > I was running a little behind on the fixes merges, sorry about that.
> >
> > As it's getting a little late for 7.3, I would suggest skipping this
> > one patch as it is a bit large and is a cleanup rather than a fix.
> >
> > I would instead merge this directly for 7.4 but still take the other
> > ones for 7.3. Let me know if there is some reason I missed why this
> > needs to be in 7.3 after all.
>
> I agree it's pretty late for v7.3. I am fine for v7.4 if Bjorn is able
> to keep the dependencies sorted.

Looks like we were also not able to land this cleanup patch in v7.4-rc1:

firmware: qcom_scm: Remove SCM PAS wrappers

Would you be able to merge it for the v7.4-rc2 at-least? This is just
causing issues with patches being developed on top.

-Sumit


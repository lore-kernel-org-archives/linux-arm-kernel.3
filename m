Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5CF606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 08:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lqS0TNuQ;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ib9L1Dlh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UlxclWWo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mmllJ+uXvvHcM6LuUW8/Fr+YPtzrcmRcBhLz9Ri9Lqg=; b=lqS0TNuQw1xoFdUUpFDb+H1/rB
	fkYQTqUDK3/Go8ZVrRryaxQWBx/xS3A5EsOx0TLasUzORQS6+hE35UHCmNiZG36WQLtNaThBzK2Gh
	+N/KZDUtH0Fb1bTP0aF5Y0SAkm37/NGFs4QnwImJYcFTD7MObaRc/E3X+7eASYNikxEfktDBfaYRP
	Ka26nLX3G/lXaZbUvUNUI7o51EjZJbUk/yASO00Y0jvrmdgZzGnSwOVBbD/fRx4nVeEHwL2XYj5nv
	9IiiB4Zd/rin8PCLRob7/X0y/v1uY2i/KE0gJ1ohn/97HQd/0qpXyx0k4UJCfop7igt7mW7oQ5N64
	cYj23FIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcsq-0000000461u-3jHG;
	Tue, 27 Oct 2026 08:50:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcso-0000000461G-1U9h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 08:50:15 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8gFwX2761222
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 08:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mmllJ+uXvvHcM6LuUW8/Fr+Y
	PtzrcmRcBhLz9Ri9Lqg=; b=ib9L1DlhuUsKOMYtISN8lfypSlHItgn9BDIPAo72
	yl0jbtnqDgrk61AmyeiZJz7oGslsv7sjZm21eXi9hmwmixHh53AEZpuaeWG9gpPb
	IR0eXAJWOARj0HFGK0QL4AC3AL8YmMkhizY5Wc+RcdL2QyKcGX2Jf1Bxq2sYpz3V
	zlk25sTbfB2gDiQjTNforaAwxUaS2LZSxJG5AFLYoO44GHwVRJjQ0RRwQrir6BTi
	gut56YRJM8+z2PS1/jgjitLk37eyqeys+AK/+BO/clS7+rJHwrZYrnEjUOLfjGoG
	niKop6X35isBcWeoAUCe7ZQsH1uoaP+x0FfDI+cHqj/uXw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh919kv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 08:50:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ecdc701a2so516033085a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 01:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793091012; x=1793695812; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mmllJ+uXvvHcM6LuUW8/Fr+YPtzrcmRcBhLz9Ri9Lqg=;
        b=UlxclWWo7QBmJSJDpEH/07a87/zZ4OVsGvsVLOb044CALULbLmZIYgx/wwlPVHrfIA
         HAetFD3lQHIbrzuBP9Ul9TK1iahc3MefSQcuXqfhv+xAEAu9zcGvDkd5RL6sErBgodCc
         H8HNxVPedOX0H6YZHXrBK4w3N2GRzASJBHiIHXB6DiwADWZoM4okB17QtpEiam9LkXxy
         0JNlrwh6TlB1LXOr2ouV/DrzA2xjRZy9WrGT7dWpgBlZcyWawwGU/ZEmyrrn3CbdEix5
         s6Zm1413vHw9n9Il+/pS0ffne3dTnXnXoQ9X7KB8LFnMr7fUfI56emyPuV22K2t4EPbF
         sXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793091012; x=1793695812;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mmllJ+uXvvHcM6LuUW8/Fr+YPtzrcmRcBhLz9Ri9Lqg=;
        b=jd5xFCDi7vUKVZIPWV7/VtLVSsa+dROfwMU0opiRskMduLLM6de0lh4VVi3fsoF5U6
         JZrLHfWKT4qxzVzHjT88cm83kiqn8PO5HByVMRJDq9m3yfbqm8Gik3JL4wKRWcXalqO2
         fBzRFT7qd5zYYR+Wn7pn/51tS90UwrrntF+Qmt5iyLUXxC4/8awpmLHcQlC56bmB0VQU
         G2dDqFmX8PbxhPnlGWt8vRdSvZoQJfWrgLBrz2kGi5OI9gIJYStxwD4kFqgX8cbgEa6n
         QATDpjXxZlkhFF+9oTrdOvRE22eyiBl88+OY1in8gGWQ+zgRvPK1rGfJh7MRbD2bg1n+
         vozw==
X-Forwarded-Encrypted: i=1; AKwUvBzxxtroLAXEUvNkjNZK1/+PnJbSPOusxjrXEnsLbkWryEstTRN1x1J3XtyzER+L4CshSckTWx+3yr1FnDC3GnAI@lists.infradead.org
X-Gm-Message-State: AFq9FYJF1AZ+ryGWtwDuzUtuYmMZrGF/Rrxg91T3JnmQQpMQ2Gzy4z13
	l5RxrxReTu+20tEnPk3Xk67wdITI37rwF4lA82ncetXzqNV5i/TmQV3YD2MrqlKRhI4OcY0B6M6
	L65Cr4ERcatNWQP7CBqFJrF05vgDkUzGeiWbpCvt0yLzEsFI7O1qEgRYVE28aJtVCnTHed97gnL
	yGOLOpCW9+6A==
X-Gm-Gg: AYBFou2wuTlFb0Dgwooh6KDmUJHMOAVaM7wdiYkQtSzCHYFlEJI9/7H2fIwACVSn6FJ
	pxFuhY/qB8TrNl1zOQmQI/tAPu0Y/oWnTHMB7luilocdRhDlMl0AJ9b7SoexwLFUb5U+nstIKig
	a63SGl4lXKo9CmmG9mOYLmj0dKv/HhKlodiKzHQj7o9JI1ctGKAISzlFQMS9sovowVUqdsKl2EB
	KFRJv90U04fycYK6/kYeh2KfM7s25D9SI/jv6t2Hrmk3QNmgk3nxLAhofapI+iJL2yqwJ2NrOVx
	V5PcyfMzmwr5AD5kB5j4NrUnpS13NuYJPq+DTjYSt3W6Bm0gFTUBYf7/dBSajedK3nr8PRoa2ha
	N6ENuLA7LmtFKHG12/4Blcdvv/PR6/mJTpcRgkTX+B3igWyFj
X-Received: by 2002:a05:620a:4009:b0:93a:48a:167 with SMTP id af79cd13be357-940ef952696mr1440550285a.39.1793091012169;
        Tue, 27 Oct 2026 01:50:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4009:b0:93a:48a:167 with SMTP id af79cd13be357-940ef952696mr1440547985a.39.1793091011553;
        Tue, 27 Oct 2026 01:50:11 -0700 (PDT)
Received: from localhost (net-93-144-6-81.cust.dsl.teletu.it. [93.144.6.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd49afsm21753979f8f.35.2026.10.27.01.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:50:10 -0700 (PDT)
Date: Tue, 27 Oct 2026 09:50:09 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sinfo@kernel.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rayagond Kokatanur <rayagond@vayavyalabs.com>
Subject: Re: [PATCH net v4 0/3] net: stmmac: re-apply taprio offload in
 __stmmac_open() and stmmac_resume()
Message-ID: <auBlwUjTDbmP-5b4@lore-desk>
References: <20261026-stmmac-est-fixes-v4-0-999dac4de44f@oss.qualcomm.com>
 <179303405498.3327.6709797406209936415@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vlBb5iuXm9umAb6K"
Content-Disposition: inline
In-Reply-To: <179303405498.3327.6709797406209936415@kernel.org>
X-Proofpoint-ORIG-GUID: pynqBR42CAhdttXRRQr6A7gRrHrT_MNQ
X-Proofpoint-GUID: pynqBR42CAhdttXRRQr6A7gRrHrT_MNQ
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae065c5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=jeKYxtEjmYGD5WCmXysA:9 a=CjuIK1q_8ugA:10 a=tIGJ7Hrp7TI-VMH61SMA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzNSBTYWx0ZWRfX60P4ZbYUuc7m
 CY6OLuoFWXCIuMmxvMpX48hTPEBxieNsktEDJsFPz1oI4M9dhkHwQ0OqY0lWF584YZXf/mJzNEA
 z5do2ukccVbocdmmByTNZFQS++Yei+VFYTKmmbKuQCN8EXgVhPkdJmJXaOaC7jVQU+wdiVOKrSA
 10pS3ZSSgtolqkDfh27M+GswSbY4as7d+scLHi4S+2e2v047FVeUqCsdpBZkK4CbasYP2/bpvL0
 NDdbxpsJAMT5yOSSxlKFkAfuXL5eCJdfdjOAdA4pAEAsHNCh7azSl4TNQIoWboHtqyRjlK6rJQi
 dc2gEO7a/6NZa2zXc/RggQ+VJnvVCwXBPfxQ+UtPT1yo5w0J/9e43IPLSjyrkt3GHrhcvdGm363
 9bjIuowJBPHSBnQeTNw1LHhBaRrhRmK0pio2rQKlcUPVlqbNLQu6ZVRYZmAyVUzztWct9eLN3Ea
 Rwop8T6mgmWxZPC3yJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzNSBTYWx0ZWRfXwWTnu/cSl57v
 qHRFe9SkMvDThR5y80DapZF0przR02VRST0hcMzBaliAEP25/Qg1xD3IuCxnIf6d0zPuJrV9ylA
 k5cLiH5XLXobMfNY0ZYP3EZHjND1PQ0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_015014_403743_7E2506E4 
X-CRM114-Status: GOOD (  25.33  )
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--vlBb5iuXm9umAb6K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 26, netdev-bot+sinfo@kernel.org wrote:
> Hi!
>=20
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>=20
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

The issue has been reported by sashiko

>=20
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

This is a real issue reproduced on a Qualcomm rb3-gen2 baord. Flipping the
interface down/up the EST MTL configuration is lost.

>=20
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

I tested the fix on a Qualcomm rb3-gen2 baord.

Regards,
Lorenzo

>=20
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>=20
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

--vlBb5iuXm9umAb6K
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCauBlwQAKCRA6cBh0uS2t
rG4XAPwPblbkFMjt3UOpk9xsG7z+kYXCKiPBWyd2rgnb+wB1lgD/Q34ricHLI7TE
XHy8rWR5LMTrhrHLLZEYgaz7Den7YgE=
=emFh
-----END PGP SIGNATURE-----

--vlBb5iuXm9umAb6K--


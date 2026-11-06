Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2ED606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 14:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=noBuAA5C;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=HB7KHfbr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6NEDxCP1xlNVWbzDZl40x2kZVNRASxcVTF174olVpag=; b=noBuAA5Cki19Xrr6Z5srbuaja0
	2n5f15Ob1Fz6gAt1Q/b2enTKke3l8HWTw4ov20f2VmZMcLEwNj6XUwoURPtaG7upk5kgg03sGqnVM
	UTKMCoTb4LQ68aZ48X8q/J81LEj8lnoEh6L6oJBYX6YhIjSJpQ69Es0NmXjcq9rRpIqZbOyrqnWnH
	ay4OaB9lReRshJ3jacj+LEgWAEKA7XGF3ZH+Bw6mXl7aoxjE9otRLMdFrsTTHzEkDq1KoBm69zO/o
	j1Ul1tfrJZ40lNxnvDROGwuT6xlSy5YUUMF3ncuExofFJoNpq3mlRvum9pK0OKH0IV4IDQmAed0Vl
	NzNHa5Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPL1D-0000000CgXG-3UY9;
	Fri, 06 Nov 2026 14:34:15 +0000
Received: from mx0b-00364e01.pphosted.com ([148.163.139.74])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPL19-0000000CgVn-1OkI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 14:34:13 +0000
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6DcuRl1679520
	for <linux-arm-kernel@lists.infradead.org>; Fri, 6 Nov 2026 09:34:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps01; bh=6NEDxCP1xlNVWbzDZl40x2kZVNRA
	SxcVTF174olVpag=; b=HB7KHfbr/7te2RP8UOwHGzPddg5VJkjPEiIbnJKXxAtM
	/1arVxL+0OwLMHleTH89/y0TkcJrzfL2pcG7nqNuBJUuUWGO6Vr467BpZ5k+KRXh
	e4EDEr1vfgtpwAJGILC97fAMPf/yKukD3d1B0qULBP6FIgWnLBlVgoIavrpQZgmZ
	ql1N33Fw2cBBclJ2RFf2u9dFdxfH7Vk3jNKsgkEzkpINJMWLOJNLONnRiwf6sDvw
	QX8c99pRXGWpNYsgKnpWLMQoxskExW3Nyq83HtmG9WqgdOKlI5RvLj/WOtEfe9Mu
	HBSl991SGWtJoCHM3WMi40KDIJI25LsRXMSpp8dIaA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hs3pc3ekb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 09:34:10 -0500 (EST)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b342ff3967so8900367b3.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 06:34:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793975649; cv=none;
        d=google.com; s=arc-20260327;
        b=cSacHP+ElBLZk3VGJc3DXujdOXbmnFv2xqRMipRjPSCm3ty0/Fq3LkfeE7nKq5K28F
         +S4HNVBsHR0br+thSaiCRES+zQIq5pCSPHobAM8kgzLZNsbYBpBUWDlRvT6PpPb9Pq4k
         b/61neGQRNz08bDbeKSXmTvXUpXebrijOoqKjKCKa2Qfz3i009dTN0E0isI5V2NO1U/I
         y5NWWCBFuUL0/ePGDuVpP3SYMbhXXZU+lmaJjgP6lep+c/oEYdw3si8LVqpQ27Ovf+sm
         /ztc4bWtFGu/wsMwpxIPy2WJW7XoWdedAFnu2LtOCStzVq9A2kJTup1FmWmBzheI2ytY
         e2Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=6NEDxCP1xlNVWbzDZl40x2kZVNRASxcVTF174olVpag=;
        fh=+XLHx9cVZp2MfECrm0YMyfQqkibYI8qpf2VbunOKawk=;
        b=NnKrBZP69iZvRx7PkmJAPMvG85s6pnaPHJQJmNJrdDahUy5X8+WDCj5oZLwyf5hnwD
         10EcEWNHx4zIttJT6kG04Mhh+N5xUu89rti9kLh18HQMKMJ7zxKlRzfHQZfvVDg4d/13
         t1NxIcfxZVtXuspA6ZctjEf4qFjQyziTWs6EdS+F2wGj2/ykjoMVbVB53dFgGydbbsus
         kola/ZyBDgZGYAdbQLvza+giwcPzXA+MopBmAwLke3W2gIu1e+4wrOdGm0ZXmLhfC8CB
         JvKos92bXwrLLKrp0kCPGMU26ErgDCV/3bDxGVkVxkuy+786sPVBv3UWWrpD5z4rvavo
         BRTw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793975649; x=1794580449;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6NEDxCP1xlNVWbzDZl40x2kZVNRASxcVTF174olVpag=;
        b=a2MvQLI4WmOuZEVsG7Kvq5oodEKhfXImhv6PIsImQQJQ/HMIA0xHyMbcZPp/8do+PO
         Vk6rpJ/42MFq9oXuleNiy3MHHaLe+3S0RXPid65o/oHwr2mnlRpaNEDIPWT9lLyZSNMd
         gTcBj8it7VPbDIX1E7zLIyjqF8HdWuMlzaa4Uo9UFZqNpSxpMLJ9nJwH9XL4K3jcHlaQ
         wJKgB5bDKshBa6OG2i4tzIQ2Uoy5+eTOgJNLzj8oAnrT9+fgSaImnH7Np6WqafLgQ8gs
         Bc4gWpj1B7oSigJHoKHQ5GEydQ4w8RMqj50EVJTsbgjEOBvGJQ/YeUbHv9ophZIr9Frv
         Od2A==
X-Forwarded-Encrypted: i=1; AL+hErF4VzaqwtlebXZGfULUaIiBmsl1+kwDqTuXP4DGU9gR5Fb5GVDdLTXgX2a+rkBXAJ6a6MFgRo+zv/Uxvxq0fdQH@lists.infradead.org
X-Gm-Message-State: APuU4Z9S6HeVC0GWJrAWp2neff8fQ2gHvT1sTscuTZ1HL1hQNXet4KVF
	pHuJwbktPEbeTFTbheZTIb3vllQORKe3ly2Ev3M+dD7SaHyC3LEnhzOECRljWfgCxSmrXRI+LFV
	9W6TsoNqE4NYeC+MxvbTRrbgI7iUra7AJI9qTmanjI9kN/pL1L/Ea5MWUgdqbJQuBOS605Qjksc
	NC/ivJOIobDZJZ3CwbINQxQzST8NwfN97zSn6E6JqwDqupnoc=
X-Gm-Gg: AYBFou1SKbdIvvX7Y9SX81KUBZPFM5BtKsFVEoBbFCxQekSlizqwcZHYk87VZz8bzFK
	iCIYS2of/T5fDPQ5E/4zp1KljSHaGel26pV91/6LL0uCdzukGU3yqPRz9HA7iMhZHb2YnvmJ2bz
	XS36gjP8v+0JYQmNoqYIm/IpTPDnu6uVU0E7Oc6mbf/LovCnflBE0nOMOTsB7u1Jc0tpjQHcK8d
	WTRP+NJLm+TX4c7UobcH6Vn8j2xbBnsPe8BtyPJYB2lPxLY82t3+/los314wB9tZpfIiUHbDx3y
	J29IDedUQA5y54EruCEFrM6/N2IDeHm/lA==
X-Received: by 2002:a05:690c:6d84:b0:8b3:4729:a9f6 with SMTP id 00721157ae682-8b34729f672mr7082617b3.78.1793975649562;
        Fri, 06 Nov 2026 06:34:09 -0800 (PST)
X-Received: by 2002:a05:690c:6d84:b0:8b3:4729:a9f6 with SMTP id
 00721157ae682-8b34729f672mr7082497b3.78.1793975649191; Fri, 06 Nov 2026
 06:34:09 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-hyp-pool-and-map-v2-0-44a6ca90190b@cs.columbia.edu>
 <20261105-hyp-pool-and-map-v2-3-44a6ca90190b@cs.columbia.edu> <CA+EHjTx-X_2DaO6Yt-AHsP55SFWjz_EYxEr-TB9WSN-ZT+d3FQ@mail.gmail.com>
In-Reply-To: <CA+EHjTx-X_2DaO6Yt-AHsP55SFWjz_EYxEr-TB9WSN-ZT+d3FQ@mail.gmail.com>
From: Xuheng Li <xuheng@cs.columbia.edu>
Date: Fri, 6 Nov 2026 14:33:57 +0000
X-Gm-Features: AclHuK-Zp8N5uQ35n3k4Ff40s-dY8xGBlNZLkKpIQ2XYz2iYHmj0YH4-CjtoP6I
Message-ID: <CAPOPQMB6eU0MYNewcq8HKsEMchwY-X3aT0Km9uULBappFWZcjQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] KVM: arm64: Don't replace a valid hyp block
 mapping with a table
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
X-Authority-Analysis: v=2.4 cv=CaWdd7rl c=1 sm=1 tr=0 ts=6aede562 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=wP-KkE5Gt7gKT99KiR4A:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-ORIG-GUID: b7a5maOeGFQC7Eh3OocQ6R7jD5Fye6eQ
X-Proofpoint-GUID: b7a5maOeGFQC7Eh3OocQ6R7jD5Fye6eQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NyBTYWx0ZWRfX6cvxbkLFsdvW
 XVGx8YmPDGOWx0Fyfe1wSa43D+iFPTjawwaS/5TExTEWtISTIuwg/elML+wAHe2/TuP7Ma4U7Ud
 rjk4+6mZpzR911+CKu0qW2MTzWDRSAeRUKI1+BKu0YeIWI1/jt92wKZTs8Fls1L5Uz5BeDs3aCd
 6hzjYMsU30b+qSg/Hp4zkwn6KgKyD7BJnIAKIoSyNCDh7I7OzcmL7WWDnYR1YOReaBvpHQoRl8M
 optF8gWXRTPxVX2Y5FQNbYap6NA0PL/ibYTIg37tl6ZZkfULTXxt1xYV7DWKFsf0hbb0Qlal98M
 D5/p9Xd24quLXzi0cHuH8qbXqjohCgWNYlRU2LUCVNbqWaqHpc10C6OD98rhgm2XYApt5e5i+uO
 E88XkkL1+jsWHthPEtm5neLVYJZN9AM7O10RBFZ7AQzGnsJskpp7+rRaHjO5jzelHbfLNzvG02H
 VEAzdVR/T9t0acqz8xg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NyBTYWx0ZWRfX7YiWAWQNmhgh
 /lSE9P0Kw9CS+MNtp9AQ5OywNJeoOUNDyoH5w8tJoEWmqHbtrl1Xdgzuf7QgWeSBwyY5nMZ6P5U
 0aKZZ+qhlkCbbcPrKHqScdWeL6RbNnnzHMiblkfABUj99ieru/YK
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11957
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=10
 suspectscore=0 malwarescore=0 impostorscore=10 priorityscore=1501
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_063411_489973_34CB90D8 
X-CRM114-Status: GOOD (  13.02  )
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

On Fri, Nov 06, 2026 at 12:03:29PM +0000, Fuad Tabba wrote:
> Could you mention in the message that the WARN_ON() is fatal at EL2,
> so a caller there gets a hyp panic rather than -EEXIST?
> kvm_pgtable_hyp_map() is already documented as rejecting such a
> mapping "with an error and a WARN()", which is a better reason than a
> future caller.

Thanks. I'll reword the message to say that the WARN_ON() is fatal at
EL2, and point to kvm_pgtable_hyp_map()'s documented "error and a
WARN()" instead of a future caller. With patches 1 and 2 dropped, I'll
resend this one on its own once reviews have settled.

Thanks,
Xuheng


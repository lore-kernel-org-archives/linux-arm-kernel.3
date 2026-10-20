Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7A3606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 16:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oOlnXiET;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Gf48rfDE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qZWHzH3NnPm+6fZ0ej6D+04oG74OayCVfZeDBxBBOhI=; b=oOlnXiET5pX5xMgT2ZW+HzLUbn
	6O0rgDBeCDudyzmL7YA8dHz2FQz7MnY8Gx6uOS0Fyw75Z441m3OCvXxa1xnTOBWSr3C/fIbwSlaqv
	7eJY5jwvbI9559gm5RcHgAzXZwGSrNbKKIK7CxiQWyaBKUT1TIus0c7pQzmj1+0pVOB17JOHVr12q
	+e0zR9pD77qTYonc8ID2cc5RhRsdMhhYa4SJKrWNp/RShq/ACVDerTMJgfisJ5vBekPKRfylx0HVg
	t9TPnlUiw8/lOi/+4UI5q0qghmT17sFnt88edHiEQ2YBfaEgpNYfOMZ5mYPKKwbikg+t2kwtUA0GY
	ZkHhjHHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAff-00000009v4T-2SQd;
	Tue, 20 Oct 2026 14:18:31 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAfd-00000009v1j-0e1i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 14:18:30 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-3a5a26c8412so27824621fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 07:18:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792505907; cv=none;
        d=google.com; s=arc-20260327;
        b=jDZRvyO/5fE38E5JnJS1rC3W9krd3LYoq+RytM8TOtuhierfkWN0q5uu6w0cE+21YE
         TdQxtWrR03DGorMAG0EACHiZ+oTxe9ynSoVSzwyhkVS9X0l7izpaERjpMs7EEj0kqegO
         Iyi1WYjh/ZssOxpiFG8mtj4pfV+lRsyF+nNlY8Qd5uZIoETvYIXIsGV3R+QjUlfj8wSt
         rqvptI9pnoYwu1zxHIKG0n7jMGa2IDjsj2qmuCWe+ZC3v6AIOqo2UkpidD7ATXNtbxKB
         LDuATX99hJOr3x2sy/+UvIc7MRy6wqzJxgNo8fS547la+SdWje8OpmQyG0fjmImtI8KS
         07oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qZWHzH3NnPm+6fZ0ej6D+04oG74OayCVfZeDBxBBOhI=;
        fh=JNOIs952LrefpF8Sg/ybVSvi0AmZp7qpAJOWEKACOQg=;
        b=AhCvpp7dGDCcVzG48+7Q1H1B7+jdZ6pyyMnJZbTMV2CIW2l5qsLklH0XfJJV0sWG9W
         uMfw84iA8bIcZsvAXDvI9K/wCkb1ar+mP8eH06kml2ZM1hinxDYVU+cilSMha/0RKdJO
         y6GE7nScPnOjWtDrWUbysNSDpP0mIW722qSF0vABVsjwrU1qfwdqiS/6882s9xZDI9pX
         r6Jg9yuUYZbXYqGQ2T/ANI8Akg3h8YGbKKgnl+lpIl+AyCPdR/3YgZVF0+MpqRP4v9Uf
         fhAHdwW9AriayfWN8jc4OB9JcftivlGMcy5VC7Mpuq2yuzCGJzPXDD0s6JwBvZd9jEe1
         3M1A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792505907; x=1793110707; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qZWHzH3NnPm+6fZ0ej6D+04oG74OayCVfZeDBxBBOhI=;
        b=Gf48rfDEXgUE/sdBJ0oKbEk1jeATTNoToHKaa2lj1MYNS1iwjDsxBx6NTxEQXRMHgv
         gSNlYSdi9f3DxdfPCvNh7K17SQm5hyZbgmtED5t93cAk9pusTKpPvt7lPg0MyZ2gnLpy
         Zls9cELq1aDfuoCG2KFefKynSAtlXyJPwFy45YYSyJuLCHWB3tk8aSBCbYWFei9SWSUD
         gmnYg28TVO7VU5mQ5OQY0GBWp2POn1BdShPUoyYBUfJCG0HLR2g9QElyw9B8GcjCbNf0
         xkypkBv5PAJgBEPdTXA5DxaaOIBcbtxEFpYqGX+m+Amh/v7ulkn2UYkMI8KlFZxLyeVe
         9CVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505907; x=1793110707;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qZWHzH3NnPm+6fZ0ej6D+04oG74OayCVfZeDBxBBOhI=;
        b=zWzmxRDsvsxevQknVnRCExERTP/hHH+sZXim0HTHEvTNQ9eEsGi5OMMIyOtc6BspdW
         7N5ecW8PAH2iWK8zoyDfs0FmMlHeSaSLStyHuNn8Af2PSDUd+8O0/KPum6wavJPsVX5i
         NgIMp0TiDj+Z+wiaPUvxPm/BvQ8FkzR2WIbiFIouS4eyTjtVNs8TF9kHCLvcLIL77+1I
         GC56yaZJnHPaYdIlA2McV+DNdMwyJVnz31fHknERKZzPRD0hFIQT+ZPPAoqQNtfTWINE
         fjnMVxGfSa7KC+KlstTtal+lMbLDa2AyofoWH4182NW9Bt3OeBcnryz3lg9MxQhFS6La
         Wbyw==
X-Forwarded-Encrypted: i=1; AKwUvBw1n+r/B0k1pmUH2Nz/IVuGOVnLJzHV8NgAuG/bTxLeUG4TkWIcgWCWQxUSZJNGnJm8Gc5u7tcRYk7PhUojEY1J@lists.infradead.org
X-Gm-Message-State: AFq9FYKJPmZUCZPeazQzaB0eMm1ujkMM2/hwaJAybGhIz4ZYma6xhZrq
	ghr0Z0e9NDNJLGDcQ//4MczFZjnwGPjskvkF8mfIOUnD4RgkBXNTiiwZGRAGX0DBDyekj8W4yxf
	a1uhTJGmXGa7IFgWCIY9mLvZnyOpXBCPAMQ==
X-Gm-Gg: AYBFou3u/BXMPgJnH/AGon5QHF479yxvt/5FF0Wg6+gwehqcLULhxACrL7AaRb/Z/up
	l4NnYksb6GN6o80y03ELHc7eZ8fifz4xNh5L44dHmmjgZMyei0UgeCdgb6PQlBsjM6WNFamQmoU
	AWMMP2ppy4epyNmYpDX6GwKLCNVxzzkKz/7cg7AZippy8h+4+W3wjEQl3zdLh9SZJkQXon9sLdF
	tAyGhMM5MkvX0FI1G77VBIR5Prgbjwx5WJdoAIzxSJA+BGgFsxGn0qoWepEkDFRzAg4WggTqpn9
	ppX5IAtZA65k8CQ/Nb3C8ZVpyJf1abS5Qv10MOta/CAF0vGkYSu/Vh/84z2wNYUcgaPCo5A4URq
	aDWJvOs8JMaNNZaEiHFMm44OWxHQcKalyKx9Sm0qwPtXP
X-Received: by 2002:a05:651c:1502:b0:3ab:fecf:51f5 with SMTP id
 38308e7fff4ca-3abfecf5453mr2731441fa.14.1792505906296; Tue, 20 Oct 2026
 07:18:26 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CAOMZO5DgENq8RU6s2CPnKsf53i=7zoBeO38m_BtV=w54hr2hgQ@mail.gmail.com>
 <VI0PR04MB122628C9AF157A9732C27068795F72@VI0PR04MB12262.eurprd04.prod.outlook.com>
In-Reply-To: <VI0PR04MB122628C9AF157A9732C27068795F72@VI0PR04MB12262.eurprd04.prod.outlook.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 20 Oct 2026 11:18:14 -0300
X-Gm-Features: AclHuK8hpD2Os0ESDXX9mxH4L7Jl1YEgykxYhPw0QzWjgIEF_lqhSiFkxHww6Ws
Message-ID: <CAOMZO5D595NYX04sw=gkKSy0Chx4d6Rn9YB4SvJtcyUCGvU_ig@mail.gmail.com>
Subject: Re: [EXT] i.MX95: EdgeLock Enclave secure storage
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Schrempf Frieder <frieder.schrempf@kontron.de>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Stefano Babic <sbabic@nabladev.com>, Frank Li <frank.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_071829_220148_45A0D8BD 
X-CRM114-Status: GOOD (  13.30  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Pankaj,

On Tue, Jun 30, 2026 at 9:06=E2=80=AFAM Pankaj Gupta <pankaj.gupta@nxp.com>=
 wrote:

> > - An ELE-backed trusted-key provider for the Linux trusted key framewor=
k.
> Work in this area is currently ongoing. The intention is to provide an EL=
E-backed trusted key implementation that can integrate with the Linux trust=
ed key framework.
>
> > - Integration allowing Linux to use ELE as a key-sealing/ unsealing bac=
kend.
> Support for using ELE as a backend for key sealing and unsealing is also =
under development and is planned to build on top of the trusted key support=
.

> > Are you aware of any ongoing upstream or planned development activities=
 in
> > these areas, particularly for i.MX95?
>
> The activities mentioned above are the primary ongoing efforts related to=
 secure storage and key management on i.MX95.
> As these developments progress, they will be proposed and discussed throu=
gh the relevant upstream mailing lists.

Do you know if there has been any progress on secure storage and key
management on i.MX95?

If so, could you point me to existing patches or git repos with this
work-in-progress material so I can test it?

Thanks,

Fabio Estevam


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B5FCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 12:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+NfyDLuumrWjIJ8nZ18sLy1cetj/M6SWZHlBf6Drw0=; b=V/saM9J1pdsQhatxgF/slVnH9/
	LPpqpkqyjWUOGJ6M6EAHiaqXhJBPCe8JFxLhvysR+VnzohhEYJdPLRrNdOwhDzjRFyoA7xGq+l/wt
	e9B4dCDpgUbNKZaj4go7D/UJo2c82FkZLG7D2HIwhNPmggCXUTJqOG5Bkjuok0KR8MSD4o/Ef02in
	4NaljF7RZ4gKN/Zb7/M/WUtAILUOOiD8Gk4hb+cI4FrQlY2smAUwUQP0UwSzeGQeVCVezNLBCbhe5
	zJJE/b4SLrvkQlqpOhkbS2LRoMl7UGLhasXyEkoBvhYeTqZoFxbVoXOTpnFhcQWf4FknaU/6w3EZ2
	FX5gEfsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwfF-0000000FY6X-0BIX;
	Mon, 18 May 2026 12:01:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwfD-0000000FY5q-1tvo
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 12:01:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=e+NfyDLuumrWjIJ8nZ18sLy1cetj/M6SWZHlBf6Drw0=; b=VYgHWfKqY4g5G87GtB7N1OlT7j
	IzOFFsnOcEpoz3QtE4LJYy2EwXeIfb8TOo8Pw6g+y22FqZqNV24Sx/wwjhbxuaZTNoeqidXyEk2Kf
	RIRUiw5i+gbF40pEYQzZ4kuFTeQ3JgpyJnCmGhFHlVAt8woyk1jSogvFcWBKcV48yyD0QIWPdGx+K
	3Thzj32L5BNg/j1w5XfGCI4+FDLaCk5UhwdI67IHGHtypSX+/HzqQAsRZ8Yt80uKzb6tBr73AM0oW
	QmpyOfQlw7UqRUaOZjLGUh7zeJSzqnMUVN5Td4d76l+9MaBmojmMHoGXsX0Qjs2PpbbvTChk9s8lu
	gTbRNUsA==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwf9-0000000B38e-33kB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 12:01:38 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I4pAvi223129;
	Mon, 18 May 2026 12:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=e+NfyD
	LuumrWjIJ8nZ18sLy1cetj/M6SWZHlBf6Drw0=; b=njJP1rZ2c2v3NtdTLLqYNf
	p8KnGsEdfcJtg7vaHYrYpjnokq0810Y07MhfMD/o23aP+nBA8OOOtIPfMFCxztQa
	cPIo7O2ATzfpCYiuHdAoKmbs3/QITYDZOtpEBZ4VC19hjhzcvPA3FnZgRC9T00w1
	jT2FqvyzcpZTQNmrG9T9n2Jff+byWnU6n79fSEJLswDbghFj4cXE9jRNQYG5F1Pu
	8xL8uOc40JnAL7FksWJ8nWeTL9kleaPsrAPA8JRxhwU2FZoaTJGA9WRrKscGhyL4
	togDWrXt73xzbLtZzEeN6MfWsPvsESrsEbhyi0VWpkTOeXdPJaLo5O8gWBrbXFzQ
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4e6h887dcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 12:01:07 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64IBs6BJ000761;
	Mon, 18 May 2026 12:01:06 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4e739vnunf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 12:01:06 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64IC128P22544812
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 18 May 2026 12:01:02 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 723802004F;
	Mon, 18 May 2026 12:01:02 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2DB6E2004E;
	Mon, 18 May 2026 12:01:02 +0000 (GMT)
Received: from [9.52.210.163] (unknown [9.52.210.163])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 18 May 2026 12:01:02 +0000 (GMT)
Message-ID: <c0619e4edfa06764bcbd0ab759f0dd03e3d21041.camel@linux.ibm.com>
Subject: Re: [PATCH 4/5] x86/pci: Use official API to iterate over PCI buses
From: Gerd Bayer <gbayer@linux.ibm.com>
To: Dave Hansen <dave.hansen@intel.com>,
        Richard Henderson	
 <richard.henderson@linaro.org>,
        Matt Turner <mattst88@gmail.com>, Magnus
 Lindholm <linmag7@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Madhavan Srinivasan	 <maddy@linux.ibm.com>,
        Michael Ellerman
 <mpe@ellerman.id.au>,
        Nicholas Piggin	 <npiggin@gmail.com>,
        "Christophe
 Leroy (CS GROUP)" <chleroy@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
 <mingo@redhat.com>,
        Borislav Petkov	 <bp@alien8.de>,
        Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin"	
 <hpa@zytor.com>
Cc: Yinghai Lu <yinghai@kernel.org>, linux-alpha@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
        Gerd Bayer
	 <gbayer@linux.ibm.com>
Date: Mon, 18 May 2026 14:01:01 +0200
In-Reply-To: <553c703f-ba9c-4785-91ba-2cf62ceb9653@intel.com>
References: <20260515-priv_root_buses-v1-0-f8e393c57390@linux.ibm.com>
	 <20260515-priv_root_buses-v1-4-f8e393c57390@linux.ibm.com>
	 <553c703f-ba9c-4785-91ba-2cf62ceb9653@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: QFZHyjzOvy-Azmh1oH1xaLzVGu-OSuD7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDExMiBTYWx0ZWRfXzuNcKh95vCxd
 geQ08wF4Un+p2fnxHLsnhgPUBABNVbMhhVCu73sej8lMYh8RWdrbhgMQebWKVfaHnkhz1LAc+aA
 Wsdy9Q+6XvBmaOIKDmZ1XbODr04OApHMW6yxApQqLrMEMAaZ2zdeZaw2Osk2WtjnqRhNtMXy+Md
 WIG3xo9+bYLjSW/74ydiwbpbWanMqcbkh4rW+P1iWEG49h6VoFoAnR6WWh8XWNj32/ezq6aXKQB
 tLuymqkb2ee1QqFT+dGxPdReJ/Em4/ZOLindDY94N/F5vk1/QH/tghR+SuLQIl1wC4CarqW7KEA
 bsywluft/Wt8VcC91NHDXDkKayHfSnipG8PUSan6nv5otfjzej3mZHvpF7+hRUhWi2C5vR/ZNhN
 W+jjgO/lVPIUzgD4kMLQG2RvJKPjq3gtrCcUg9mzwucqg7K0ieqvsbj86MNnELg2PzQmlbgztUX
 g8ZCup7yUZfilLlWtAw==
X-Proofpoint-GUID: kcV6MLuFtMArK-fCd0goVCjhbn9bE92K
X-Authority-Analysis: v=2.4 cv=apyCzyZV c=1 sm=1 tr=0 ts=6a0aff83 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=K1lEL3VxD7dyB7CPxK4A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_130136_867304_D96FAC3E 
X-CRM114-Status: GOOD (  18.31  )
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

On Fri, 2026-05-15 at 08:13 -0700, Dave Hansen wrote:
> On 5/15/26 07:22, Gerd Bayer wrote:
> >  static int __init pcibios_assign_resources(void)
> >  {
> > -	struct pci_bus *bus;
> > +	struct pci_bus *bus =3D NULL;
> > =20
> >  	if (!(pci_probe & PCI_ASSIGN_ROMS))
> > -		list_for_each_entry(bus, &pci_root_buses, node)
> > +		while ((bus =3D pci_find_next_bus(bus)) !=3D NULL)
> >  			pcibios_allocate_rom_resources(bus);
>=20
> What's with the 'bus =3D NULL'? I thought there was some crazy macro magi=
c
> going on or something, but pci_find_next_bus() looks like a normal
> function that's just taking a pointer and not _modifying_ the pointer val=
ue.

Initializing 'bus =3D NULL" makes sure, that pci_find_next_bus() starts
at the list head; list_for_each_entry() did that implicitly. I didn't
want to rely on implicit zero-init for local var's on all the various
architectures. But I'm fine to drop it here, if you prefer.

>=20
> Also, wouldn't this be a more readable way of writing what you have?
>=20
> 	while (bus =3D pci_find_next_bus(bus))

Yeah, another occasion of me being (overly?) verbose.
arch/sparc/kernel/pci.c was my blueprint. Again, something that I'm ok
to drop.

>=20
> For that matter isn't the kernel idiom for these things:
>=20
> 	for_each_pci_bus(bus) {
> 		// do bus stuff
> 	}
>=20
> I'm kinda surprised there isn't one of those already.

Just guessing: There was too little use of pci_find_next_bus() to
warrant that short-cut. But I can make a proposal in the next
iteration.

Thanks,
Gerd


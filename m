Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2867E606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 14:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qRFSHV+3;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GWohPSZS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jVJqL4I4y472G0Q6wLzHZmAywTDytRykoFu2yY/5u1M=; b=qRFSHV+3mduYNm
	Fn9OxoNjX4IJ6D/cW9RF6K8nzJ3bnclNxbYpdX6NPeWTJNXXTu/NCrygY/O4zb6aU93hC2XuIcaWG
	C9p6W/Tm+fo98LvmVmSs9dxwSiacje6fqyYHHBLaGWRmpjmhbphH0kAAMGhgzENjtyIXWE1jNRCNi
	HLkhDTAK3/qkBfiVKoAohNyNyvnQvum+/WEkeP2uH1hZFuuRuVYIr+UdZcldiz/D0k53sT795q6uL
	5qh+lRDXD7PkCLrWT1x0hCpNDetqkXdBdqL8crUkBPodilKZri8Cui2EmCAC16xHq5cg6zc8I9EMU
	N7nIOss/gkzRjYmYfztA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFQT-00000002i58-1Nz7;
	Tue, 03 Nov 2026 14:23:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFQN-00000002i3G-3Lhs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 14:23:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793715819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jVJqL4I4y472G0Q6wLzHZmAywTDytRykoFu2yY/5u1M=;
	b=GWohPSZSo+D08mJUIkwFW598amzEX+CylzeIQbE8UspnFGCd7/tEl/4bhNmAOyF51nG/Sq
	Yo+nkZlZTjpbQniOMxGBM6zVJcgANrWoUVxCIjtv/WHQeF20UyWwAaFoyWoJ1PFmZBxYm2
	xIWw2zmReUgsbP//i5BFk+EOitKA39Y=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-jmfk9zIuPgeIB83kkTOsIg-1; Tue, 03 Nov 2026 09:23:38 -0500
X-MC-Unique: jmfk9zIuPgeIB83kkTOsIg-1
X-Mimecast-MFC-AGG-ID: jmfk9zIuPgeIB83kkTOsIg_1793715817
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b0d36c1db7so75089587b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 06:23:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715817; x=1794320617;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gWoYlwGZBZdXV47pdKIqYIGD/ibOKiiXBV4vQIGaku8=;
        b=aaakj1brpIb+sJb1OypqyKKXZ9q9qIJFH/7jbUoF+VgS9pHTHw0xOi5m90BzafBiG2
         Ki+93FQZCBbMCjYQ5iKw+LDE+JdDWHdFv6++Spse/JLphzbZ/4wOa1ExafPtJh4DUFON
         Kri6p+CJVsX+R0eQGr2CGSq4Bo8Y7aHFPuQ//81qcDFDMmjaRPSHcUUjvklHwskoI0s4
         TKYKGSbAxAG0OAy+Dd5LdFA+2f2oSi5nZ2T/pcTRYLP0QocTTKuYPJHcmGletaO/xQmY
         iQyLmiLz5EMPIczqZRatcPK/pVw453MuMPmlDeFKy30f3FQmYXDi2c0SPChmGc8lUnr3
         gosg==
X-Forwarded-Encrypted: i=1; AKwUvByoka1J3dQJuTpgtreplWkyd2sYclAayree/cCX9rSm02IaPdPIuGviOV5P8wd3NdQ8GKf4tU6oIizXzwyuxUGq@lists.infradead.org
X-Gm-Message-State: APuU4Z/C4DKMI10k/2AkaM/mttob9N4iWRbnnKX1S0uEQYL06AlQIp2e
	XUJVhQZXuMoZ05Bf8P6wKg7zyT9s7BNc7grZs9eslsJrUqkJQa57bgEkQy7bg3KCUMSGbpcw9np
	Mt4LOG4/U0lvwtKSCO8vJ1RQClUcvkT91XLmNL4htRfxHb/vpxj/GyxYS5rfsn1k1GZlsrDwxAj
	sa
X-Gm-Gg: AYBFou2ln6J5XqtQ/5ulaxOSX2+ChYQEJDKUZhdWk/FxFNgHF2dRiZ9R+q/qu6oj5nx
	ap82RjHelW5NV0Cs/k6HjVTTO27kvB2gcsCimqy2R6LBBlxJPE36I5sJE4Z+WiIFaByiqMv3bjj
	jWw+NEkaK2pyKlk7SRJ0F8Q7fKhTmcPDU0yW7eKbQWe3WD3+y4OwnoGqs5GbXTM6/EDjAalFfCM
	+duRlgH8weWxxVqXLjGuoVYtMjkN/2QxTxN0WN0kikFr+/V/+J0cvKNNiNEfSN/dhBZ6Y68yt+3
	WR6JbbRiRqkA9pUKoGnnzXtX4L6rsQbaRhM7yCfC7wbePjCr21RyWGGppv0XJFZ+Hx07QqT9n7T
	hB3b7GIT3l7UDV+nTbNTc2kPkWpH/kdgaZrsMim1Lgh+LKiqWQTD9MEOkffM/ftB4+F1RF9wncM
	mpvJ3rw2RYsq2JTrojYsxqsGkVDFGpqAylP4ya19o5XtCeAvW5IUcmptfey/ehD4cy4GnzDos=
X-Received: by 2002:a05:690c:e0dc:20b0:8b0:d785:b850 with SMTP id 00721157ae682-8b2b6740970mr69138857b3.29.1793715817338;
        Tue, 03 Nov 2026 06:23:37 -0800 (PST)
X-Received: by 2002:a05:690c:e0dc:20b0:8b0:d785:b850 with SMTP id 00721157ae682-8b2b6740970mr69138647b3.29.1793715816681;
        Tue, 03 Nov 2026 06:23:36 -0800 (PST)
Received: from loberman-thinkpadp16gen3.rmtusma.csb ([2600:6c65:2440:d8c:aa2b:ddff:fe88:da74])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b704e62esm72882177b3.3.2026.11.03.06.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:23:35 -0800 (PST)
Message-ID: <8e4ba1820a7c56867bf7fff07bd52ff3f79573a1.camel@redhat.com>
Subject: Re: =?UTF-8?Q?=E2=9D=8C?= FAIL (MISSED 10 of 54): Test report for
 for-kernelci (7.4.0-rc1, upstream-arm-next, 6628e7d4)
From: Laurence Oberman <loberman@redhat.com>
To: Catalin Marinas <catalin.marinas@arm.com>, cki-project@redhat.com
Cc: mpatalan@redhat.com, ftjahjad@redhat.com, fsuba@redhat.com, 
	linux-arm-kernel@lists.infradead.org, jmoyer@redhat.com, will@kernel.org, 
	bgoncalv@redhat.com, Ming Lei <ming.lei@redhat.com>, Wenchao Hao
	 <haowenchao22@gmail.com>, "Martin K. Petersen" <mkp@kernel.org>, 
	linux-scsi@vger.kernel.org
Date: Tue, 03 Nov 2026 09:23:34 -0500
In-Reply-To: <auja2VnJTp-ijxqu@arm.com>
References: <13572.126110208530702698@us-mta-627.us.mimecast.lan>
	 <auja2VnJTp-ijxqu@arm.com>
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ssG0DO23y0LHwqz6996QMkcHT-XOifFUukgJZCRH0R8_1793715817
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_062344_121237_BBD5AC60 
X-CRM114-Status: GOOD (  23.77  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2026-11-02 at 18:47 +0000, Catalin Marinas wrote:
> On Mon, Nov 02, 2026 at 01:53:04PM -0000,
> cki-project@redhat.com=C2=A0wrote:
> > Hi, we tested your kernel and here are the results:
> >=20
> > =C2=A0=C2=A0=C2=A0 Overall result: FAILED
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Merge: OK
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Compile: O=
K
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Test: FAILED
> >=20
> >=20
> > Kernel information:
> > =C2=A0=C2=A0=C2=A0 Commit message: Linux 7.4-rc1
> >=20
> > You can find all the details about the test run at
> > =C2=A0=C2=A0=C2=A0
> > https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:3017229113
> >=20
> > One or more kernel tests failed:
> > =C2=A0=C2=A0=C2=A0 Unrecognized or new issues:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Boot test
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 aarch64
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Logs:
> > https://datawarehouse.cki-project.org/kcidb/tests/redhat:3017229113_aar=
ch64_kernel_kcidb_tool_1200606255_6
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Non-passing ran subtests:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=9D=8C F=
AIL Panic: Oops:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=9A=A1 E=
RROR Warn: External Watchdog Expired
>=20
> This one doesn't seem to have a console log.
>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Storage - blktests - throtl
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 aarch64
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Logs:
> > https://datawarehouse.cki-project.org/kcidb/tests/redhat:3017229113_aar=
ch64_kernel_kcidb_tool_1200606256_8
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Non-passing ran subtests:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=9D=8C F=
AIL Panic: Oops:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=9A=A1 E=
RROR Warn: External Watchdog Expired
>=20
> Kernel panic here but not arm64 specific. It looks like a possible
> scsi_debug teardown race. IIUC, b402a0dce64a ("scsi: scsi_debug: Fix
> create target debugfs failure") fixes the synchronization before
> target
> creation but not on module exit. The bug is probably from
> f084fe52c640
> ("scsi: scsi_debug: Add debugfs interface to fail target reset") if I
> look at the recent fix.
>=20
> Adding some linux-scsi people. The panic from the log:
>=20
> =C2=A0 run blktests throtl/001 at 2026-11-02 12:17:14=20
> =C2=A0 sd 48:0:0:0: [sdb] Synchronizin=20
> =C2=A0 sd 48:0:0:0: [sdb] Synchronizing SCSI cache=20
> =C2=A0 Unable to handle kernel NULL pointer dereference at virtual addres=
s
> 0000000000000098=20
> =C2=A0 Mem abort info:=20
> =C2=A0=C2=A0=C2=A0 ESR =3D 0x0000000096000004=20
> =C2=A0=C2=A0=C2=A0 EC =3D 0x25: DABT (current EL), IL =3D 32 bits=20
> =C2=A0=C2=A0=C2=A0 SET =3D 0, FnV =3D 0=20
> =C2=A0=C2=A0=C2=A0 EA =3D 0, S1PTW =3D 0=20
> =C2=A0=C2=A0=C2=A0 FSC =3D 0x04: level 0 translation fault=20
> =C2=A0 Data abort info:=20
> =C2=A0=C2=A0=C2=A0 ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D 0x00000000=20
> =C2=A0=C2=A0=C2=A0 CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0=20
> =C2=A0=C2=A0=C2=A0 GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0=20
> =C2=A0 user pgtable: 4k pages, 48-bit VAs, pgdp=3D000008001137a000=20
> =C2=A0 [0000000000000098] pgd=3D0000000000000000, p4d=3D0000000000000000=
=20
> =C2=A0 Internal error: Oops: 0000000096000004 [#1]=C2=A0 SMP=20
> =C2=A0 Modules linked in: null_blk scsi_debug(-) sunrpc rfkill vfat fat
> cppc_cpufreq acpi_ipmi ipmi_ssif ipmi_devintf ipmi_msghandler igb
> arm_spe_pmu arm_dmc620_pmu arm_cmn arm_dsu_pmu acpi_tad
> acpiphp_ampere_altra fuse zram lz4hc_compress xfs ghash_ce
> onboard_usb_dev gf128mul sbsa_gwdt ast i2c_algo_bit xgene_hwmon
> i2c_dev [last unloaded: null_blk]=20
> =C2=A0 CPU: 111 UID: 0 PID: 5282 Comm: kworker/u624:1 Not tainted 7.4.0-
> rc1 #1 PREEMPT(lazy)=C2=A0=20
> =C2=A0 Hardware name: GIGABYTE R152-P31-00/MP32-AR1-00, BIOS F31n (SCP:
> 2.10.20220810) 09/30/2022=20
> =C2=A0 Workqueue: async async_run_entry_fn=20
> =C2=A0 pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)=
=20
> =C2=A0 pc : down_write+0x30/0xc0=20
> =C2=A0 lr : __simple_recursive_removal+0x64/0x200=20
> =C2=A0 sp : ffff800087713c70=20
> =C2=A0 x29: ffff800087713c70 x28: 0000000000000098 x27: 0000000000000000=
=20
> =C2=A0 x26: 0000000040000200 x25: 0000000000000200 x24: ffffb32d18b6e0f8=
=20
> =C2=A0 x23: 0000000000000001 x22: ffff07ffab302c00 x21: 000000262b740085=
=20
> =C2=A0 x20: 0000000000000000 x19: ffff07ffab302c00 x18: 000000000000006f=
=20
> =C2=A0 x17: 643d4d4554535953 x16: ffffb32d19b31ac0 x15: ffffb32d1bfe2200=
=20
> =C2=A0 x14: 0000000000000000 x13: 0000000000000028 x12: 0101010101010101=
=20
> =C2=A0 x11: 7f7f7f7f7f7f7f7f x10: fefefefefefefeff x9 : ffffb32d189f35dc=
=20
> =C2=A0 x8 : 00000026177d76b0 x7 : ffffb32d1bfde000 x6 : ffffb32d185cf628=
=20
> =C2=A0 x5 : 000000000002d078 x4 : 0000000000000064 x3 : ffffff8000000000=
=20
> =C2=A0 x2 : 0000000000000001 x1 : 0000000000000000 x0 : 0000000000000098=
=20
> =C2=A0 Call trace:=20
> =C2=A0=C2=A0 down_write+0x30/0xc0 (P)=20
> =C2=A0=C2=A0 __simple_recursive_removal+0x64/0x200=20
> =C2=A0=C2=A0 simple_recursive_removal+0x1c/0x30=20
> =C2=A0=C2=A0 debugfs_remove+0x64/0x88=20
> =C2=A0=C2=A0 sdebug_tartget_cleanup_async+0x24/0x48 [scsi_debug]=20
> =C2=A0=C2=A0 async_run_entry_fn+0x40/0x198=20
> =C2=A0=C2=A0 process_one_work+0x1b4/0x4b8=20
> =C2=A0=C2=A0 worker_thread+0x18c/0x2f0=20
> =C2=A0=C2=A0 kthread+0x128/0x150=20
> =C2=A0=C2=A0 ret_from_fork+0x10/0x20=20
> =C2=A0 Code: b9001041 d503201f d2800001 d2800022 (c8e17c02)=C2=A0=20

Subject: Re: =E2=9D=8C FAIL (MISSED 10 of 54): Test report for for-kernelci
(7.4.0-rc1, upstream-arm-next, 6628e7d4)

Hi,

I agree with the analysis. sdebug_target_destroy() defers removal of
the per-target debugfs directory to sdebug_tartget_cleanup_async() on
sdebug_async_domain. b402a0dce64a added async_synchronize_full_domain()
before target creation, but scsi_debug_exit() still removes the hosts
and goes straight to debugfs_remove(sdebug_debugfs_root) without
waiting for that domain.

So the recursive removal of the root can tear down the per-target
dentries before the pending async work runs. That work then calls
debugfs_remove() on a stale dentry, which matches the NULL inode in
down_write() from __simple_recursive_removal() in the trace. The
pending work can also run after the module text has been freed.

Could you give the test patch below a run with blktests throtl/001 on
the system that hit this? It is untested on my side so far. If it
holds up I will send it formally with your Tested-by.

[TEST PATCH] scsi: scsi_debug: Wait for async target cleanup on module
exit

Fixes: f084fe52c640 ("scsi: scsi_debug: Add debugfs interface to fail
target reset")
Signed-off-by: Laurence Oberman <loberman@redhat.com>
---
 drivers/scsi/scsi_debug.c | 2 ++
 1 file changed, 2 insertions(+)

--- a/drivers/scsi/scsi_debug.c
+++ b/drivers/scsi/scsi_debug.c
@@ -9047,6 +9047,8 @@ static void __exit scsi_debug_exit(void)
=20
 =09for (; k; k--)
 =09=09sdebug_do_remove_host(true);
+=09/* Wait for deferred per-target debugfs cleanup before
removing the root */
+=09async_synchronize_full_domain(&sdebug_async_domain);
 =09driver_unregister(&sdebug_driverfs_driver);
 =09bus_unregister(&pseudo_lld_bus);
 =09root_device_unregister(pseudo_primary);

Thanks,
Laurence



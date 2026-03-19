Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8088B1075274
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 08:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5vVbGHY0Z9S4PWTSiGp1An2ovbBKnDNi0IvWUwoLoQo=; b=lxcKN0k5MAlsFlTWI7IGQcd5ux
	8OshWeENeJDMGkzv+vcvGhC6orvkSuLpaNAGWC27eD3KjH7cK/pWtJOPr10c7fAmbYsCZKcwM8z2i
	7vLJPjQ/fN2yjdQnmZSrEUyBObmVWMyXYpaxiYG71uTZv5Z8+1hvJqwGjjZNLjan3kdevlh1tnJLE
	7v59iU4CcPzWd6AdL53y8OrJhLYliDreCNLXFlTY1Xl2QJA88cIIP9qgwaN1riZ0PzGnHdlOE07Cn
	ePDLAkDz+zPCZFXEc7LmXJVm/bHlyQ8+HicuHmWDp1L042gh4q4RO7JlEmiXQanhka7swIPR1VauI
	k33tzJnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w38Ph-0000000ACx1-1rCg;
	Thu, 19 Mar 2026 08:07:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w38Pf-0000000ACwp-2wCu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 08:07:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 26D82600AD;
	Thu, 19 Mar 2026 08:07:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77302C19424;
	Thu, 19 Mar 2026 08:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773907646;
	bh=/eggGJc8w0dVMpTXWMeYMFm/znwA+edXs/5l6qyW4PE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yqv2xAS9fjzDIa7+qFMFWEC3da1aX7vqYq3Nm7gvhUEnG0sIodlyG5dShrFBWRyZb
	 kcCgtrw/+Zsppc5EMEN2Pz2HFIfNmMbs0Rid6utUuSOgXEZfT2tty4+Q5480DeMcAO
	 cJZRPVTeSRVKHUyK5HdiJqua0tr12r0BGKFnU50su6MR+YRH78Za65A4Veqh57N1Sw
	 9dXnkVUTpeeHxIeY9p2gsfWrrV9YSYEgogVN6D1+cXz5vZeib1RfsN5b+31oUMWllR
	 wFRreAhlODAlh7IyNtSGCNaPekZgTtIVMjq1OMW9nzXYuu8yQRRP4GTeimdBVrpadm
	 1aRZZYmhSNzsQ==
Date: Thu, 19 Mar 2026 09:07:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v21 0/6] Introduction of a remoteproc tee to load signed
 firmware
Message-ID: <20260319-fiery-onyx-serval-aceb17@quoll>
References: <20260317180329.1207625-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260317180329.1207625-1-arnaud.pouliquen@foss.st.com>
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

On Tue, Mar 17, 2026 at 07:03:21PM +0100, Arnaud Pouliquen wrote:
>=20
> Main updates from version V20[4]:
> --------------------------------
> To address Rob=E2=80=99s concern on v20concerning resource declaration un=
der the
> tee node, the device tree is now structured as follows,replacing the
> child-parent hierarchy with a phandle:
>=20
>     firmware {
>         tee_rproc: optee-rproc {
>             compatible =3D "80a4c275-0a47-4905-8285-1486a9771a08";
>         };
>     };
>=20

And what is the parent here?

>     m4: m4@0 {

What sort of bus do you have here (IOW, what does this 0 mean?)

>       compatible =3D "st,stm32mp1-m4-tee";
>       reg =3D <0 0>;
>=20
>       mboxes =3D <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
>       mbox-names =3D "vq0", "vq1", "shutdown";
>=20
>       memory-region =3D <&vdev0vring0>, <&m_ipc_shm>, <&mcuram2>,
>                       <&vdev0vring1>, <&vdev0buffer>, <&retram>;
>=20
>       interrupt-parent =3D <&exti>;
>       interrupts =3D <68 1>;
>=20
>       rproc-tee-phandle =3D <&tee_rproc 0>;
>       st,auto-boot;
>       wakeup-source;
>=20
>       status =3D "okay";
>     };

Best regards,
Krzysztof



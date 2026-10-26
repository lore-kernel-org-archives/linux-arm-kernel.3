Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7084D606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 11:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HKGwxmSG;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jY4hKmWu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tD0Lls83Il+mQLYthxWqSv/YIy5kSUrF6JCqhkv/8Wo=; b=HKGwxmSGQJ+uok
	+I/+IKey7Mr6isU9zr6Xkx9njrDw8JezJ/IHfhLXCACp3BzNGhvjOptyh1I7M0WOVn77K+t/YFh9i
	o0+xbWCAzc/qw4raMc+Y5rRO7lPYKE4YxQrZdsUKP1+6s2pNf3qBbS+53VLxWNYWKpZuioPmVMgH/
	p6k2sIEeJgo4+uR3VloWYw9mKS7BQHVLI6h2KK+S9A3ZlUehPEZdOC9DXxhrgPgF9U//Nf0ETGjcg
	/PiCM1LaiYywOkZ/b2Bpgrwr7a6ldi3LHSMl8LttpXeZM/aOj2hnsWC9HMWiGAseQDwMtBlaSe2Rx
	vxis3+uzXYypdzJT9gwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLIZ0-00000002K29-2Seu;
	Mon, 26 Oct 2026 11:08:26 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLIYy-00000002K1b-0fgh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 11:08:25 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-8ac4806e210so20651027b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 04:08:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793012903; cv=none;
        d=google.com; s=arc-20260327;
        b=OkYFimoUpvsKlCg/E9RocZCGr1j/I+hpann9gPrhl/qN1kgr/aRIhJqBl3WawEuVJo
         56twA7EDRn1+CZdWv0EGvbN9eDFJ+BTGwGP9eEkeDvPCNXV7ejbo70lW4MacqEUZjwRo
         EvvLpZhsLUWXwIiBUIksCRL//EDckaNUf9C42ql/c1fIh5WUx+MUHqs7yu5Ov61X5vm5
         wX9ftp6Yz2tSq9zdM6Qb90brbMKt6dYDQxZ3pK+K3+is5y8jn3kSr+XSvb8JfmKazGnd
         gVLulNQi5b5l52rTOgg7zu13la/tp0kA5UM25wajoP/7cGZajS3HW8gjBIeJxMXOq2C8
         2R7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tD0Lls83Il+mQLYthxWqSv/YIy5kSUrF6JCqhkv/8Wo=;
        fh=4lSzRoLz1kWQYAPmRukeFo81TkqBDc66jW103HRqYys=;
        b=PDjdv5tz07BNuPKkFP/PYzzdmg91IabhYYvNwPiZrQOcSNTSjYNlZRqZko365bptsg
         hMnFlc+XnE3pr4VV9LXCkgw0InOqOyAC98T7jZ7GKPiC3PxVFV60drFpU6HvF64uZS0m
         FSCOPHNNlfZIRBa/ts2mU7G8VO13tBN+3blgvWUSWvfGqa5IE0nGZd8S8RAA5zS/R0lc
         L4+IkeiAIAz8BoqFrGFTRjqOE5IdfEWoBKzCfPlmv3lNXXAhKZgNobkH48SVfc4rfJAg
         yop36hmR4F3G5Mezynd2jY6lrCP/ZkZ4CsUUC43361weWnwIAhOuAT2IDDJMEgBAW2We
         Hl8w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793012903; x=1793617703; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tD0Lls83Il+mQLYthxWqSv/YIy5kSUrF6JCqhkv/8Wo=;
        b=jY4hKmWu/30XYXF3E/1ldB6T7hfLMicEkjb57AyplgJyvo7rTOKMPlRfMcOMyft9CM
         cURg4RERS3uE2BIZB1CfPb6Xuba2TjL3ryOkzugA36QWTUQhb7KOwvXOnLlHWcHMO6Vf
         Brt+cHf/rVyGgO4DsJiQkDa7bsQS0GeZbgbC28+YcPVhk+7T4yq1KgVgmb+z+Y7wvMT/
         P89HYKXfxJ0MtDiQR/d047f50wvvoi1gOMoH/GJJX2ExfMqQ5XHxBtwDanjB3hdguF2i
         DFC9YOWewn2cgsttc+l2/Imh6jksnA/wnea3RBks/Mee2vPDPY+ROjSL3/RRgrZ2C5g/
         AbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793012903; x=1793617703;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tD0Lls83Il+mQLYthxWqSv/YIy5kSUrF6JCqhkv/8Wo=;
        b=oKMPmXRGuT0wDdtMltl6pRclbMc4eo4SWmCSpB8AfBUsKxBY9y0JM3SN4bDsKIUScC
         sVc4Letsdr9BH5d8rmELukhdtksxtDNhzEhQ/lZhR4kKPPtp74qXY/dloi/gSbAskIqC
         aW7Nlvdy1yXsfZK4kc1YFV1EbURClYj4MU7e5lS62XQkVhRW+Vo6wuix9A7h3GXi8Qps
         v9tmwOSOy0+j1ARGVtn6nOmcw4VsxS3cDqTG53KsdaccsqrAebJInKZB6ZBACd/tlZeg
         yXFP1XIGejhd25cI/UPcf+o3LgKIdFqU1cRx3AgxfjWzS6x5KxEOLWq3Mod3ssSh2x4O
         Cv1g==
X-Forwarded-Encrypted: i=1; AKwUvBzlSt44UG3RhwOmKLHQmqU3t2yqBzsR+qx4Q+Vg/fklFCxPpQ7EUeXH4RMxdtIsME+0xBJHPcbYq+NlCmYdFas1@lists.infradead.org
X-Gm-Message-State: AFq9FYL2AfN38AEjN0jWAWrsnWdXLp83oLrFOBB0qL72FSoVpR+DkheD
	6r6aKmGwnFzYNgi0aJ5uzecpNwwuXR4GmuGeryR3bS4bLG1IcdU3CM2yZc4RZIs7og8BUVo6+ZB
	z2Wc4eBozmIwWeQopHsy9uCu1YOmimsk=
X-Gm-Gg: AYBFou3HIhsytoHtNN47pJLwPZxr+ZxRbjE/NB7eDjQsdbW2DPY8yeKigGGoayWKDQL
	WK3bJIy7dq//A3ZeZGoC08UJUQNsQoIPF9XxNE+4db6F52mIwgxQhgbt1EsNr17Kty+n6ONkQio
	JunZvNxEtU59F+1MlRQfsgvjcAUDoAOcLVPwlELtVLH3D1sSVSZxmDPKnvZX1pShjILS2PPnR5b
	DlZvkv01wdrJJODeLtLNIKvNhHDqb117VN0Kks+lCAxzhNnIIDpD2hQ6BbShpoC1g0VOvIVzkEF
	jiIe5ZlNvS7MLzy+n6TqtJJgjk3XS5mwN8DpZAgrmMHBHPjyCB5q0Vr+joHlc7dBrAdWph3wfl9
	pICUiL4+nlbsprD1i6Y6LxxY0C80lVytRv6yV4g==
X-Received: by 2002:a05:690c:c50e:b0:8aa:148:7706 with SMTP id
 00721157ae682-8b1669caf65mr45460507b3.8.1793012902608; Mon, 26 Oct 2026
 04:08:22 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CAD_a9macSzuBsmmoLu2Cu1doLADvcpASFi-6ADnOvmMdgDEfHA@mail.gmail.com>
In-Reply-To: <CAD_a9macSzuBsmmoLu2Cu1doLADvcpASFi-6ADnOvmMdgDEfHA@mail.gmail.com>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Mon, 26 Oct 2026 16:38:11 +0530
X-Gm-Features: AclHuK8Cpr6C86Ogdt3iNPcZespgzJH98h_TGBqL0O48_bvZRHN6DW3ckIu6Ds0
Message-ID: <CAMFFDGgygzu3OdFkq6+ztZOzaFMMTdYFqtkvmOtHNovQvabXQA@mail.gmail.com>
Subject: Re: [OpenBMC] Guidance on Getting Started with OpenBMC and Choosing a
 Development Board
To: KAVYA M M <kavyamadarsh@gmail.com>
Cc: openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org, 
	andrew@codeconstruct.com.au, changhuang.liang@starfivetech.com, 
	Shuah Khan <skhan@linuxfoundation.org>, Jani Nikula <jani.nikula@intel.com>, 
	Vitaly Lubart <lubvital@gmail.com>, Hanjun Guo <guohanjun@huawei.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexander Usyskin <alexander.usyskin@intel.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Breno Leitao <leitao@debian.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	James Morse <james.morse@arm.com>, Paolo Abeni <pabeni@redhat.com>, 
	Stephen Hemminger <stephen@networkplumber.org>, Dave Penkler <dpenkler@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Dan Williams <djbw@kernel.org>, 
	Mukesh Rathor <mrathor@linux.microsoft.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Alexandra Winter <wintera@linux.ibm.com>, Julian Braha <julianbraha@gmail.com>, 
	Karthikeyan KS <karthiproffesional@gmail.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Joel Stanley <joel@jms.id.au>, 
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Oskar Senft <osk@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_040824_217651_4D42AF61 
X-CRM114-Status: GOOD (  32.22  )
X-Spam-Score: -1.9 (-)
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

Hi Kavya,

Thanks for sharing your platform details and starting a separate thread.

I am also Working On OpenBMC through ASRock Rack B650D4U enablement.
My work is still in progress, and I have not worked on the Gigabyte
MZ32-AR0 or evaluated development boards within your budget, so I
cannot recommend a specific platform confidently.

For the vendor-restricted shell, I would suggest contacting Gigabyte
support about supported debugging access and recovery procedures.

My practical recovery experience is limited to the ASRock Rack B650D4U
that I am currently working on. I use a CH341A external SPI flash
programmer for BMC firmware recovery.

I have not worked on the Gigabyte MZ32-AR0, so I cannot confirm its
recovery procedure or programmer compatibility. Please verify the
flash device, required voltage, and board-specific recovery
instructions before attempting external programming.

On Mon, Oct 26, 2026 at 4:07=E2=80=AFPM KAVYA M M <kavyamadarsh@gmail.com> =
wrote:
>
> Hello OpenBMC Team,
>
> I am new to OpenBMC development and would appreciate your guidance on get=
ting started with developing and validating an OpenBMC image for a server p=
latform.
>
> I have a few general questions:
>
> 1. What hardware documentation is normally required to develop a reliable=
 OpenBMC image for a new motherboard? Are the user manual and BMC reference=
 schematic sufficient, or are the complete motherboard schematic and board-=
specific signal mappings essential?
> 2. If the original BMC firmware is available only as a binary and the mot=
herboard schematic is unavailable, what is the recommended approach for ide=
ntifying the hardware configuration and developing the initial image?
> 3. Which existing OpenBMC reference platforms are suitable for beginners =
who want to learn the Yocto/BitBake build system, device trees, machine con=
figuration, sensor integration, and required services?
> 4. Which hardware platforms provide good support for testing sensor monit=
oring, fan PWM/tachometer control, Redfish, GPIO, host power control, and p=
ower sequencing?
> 5. Which functions can be tested in QEMU, and what hardware documentation=
 and recovery facilities are necessary before proceeding with physical-boar=
d testing?
>
> Request for Guidance on Restricted BMC SSH Access
>
> I would also like to understand how to access the underlying Linux shell =
on a BMC when SSH access is restricted by the vendor firmware.
>
> For example, some BMCs provide SSH access but expose only a restricted in=
terface, such as SMASH-CLP, instead of a standard Linux shell. In such case=
s, what is the recommended and authorized method for accessing the underlyi=
ng Linux environment for debugging, inspecting system configuration, and un=
derstanding the running services?
>
> Are there standard OpenBMC debugging methods or configuration options for=
 enabling SSH shell access during development? If access is restricted by t=
he vendor firmware, what documentation or permissions would be required to =
investigate this further?
>
> My current hardware
>
> I currently have access to a Gigabyte MZ32-AR0-00 motherboard with an ASP=
EED AST2500 BMC.
>
> I am considering using this board for my OpenBMC development. However, I =
do not have access to the complete motherboard schematic, and some board-sp=
ecific hardware mappings are difficult to confirm from the available docume=
ntation and original vendor firmware.
>
> I would appreciate your advice on whether this is a suitable platform for=
 learning and developing OpenBMC, or whether a different, better-documented=
 development platform would be a more practical starting point.
>
> Request for development-board recommendations
>
> My budget for purchasing a BMC development board is approximately =E2=82=
=B95,000=E2=80=93=E2=82=B910,000.
>
> Could you recommend a specific development board or server motherboard th=
at is affordable, well documented, and preferably has an existing upstream =
OpenBMC machine configuration?
>
> Ideally, I would like a platform that supports learning and testing:
>
> - OpenBMC image building using Yocto/BitBake.
> - Hardware sensor monitoring and integration.
> - Fan PWM/tachometer control and cooling failsafe behavior.
> - Redfish and other BMC management interfaces.
> - GPIO, host power control, and power sequencing.
> - QEMU-based software testing followed by physical-board validation.
>
> My preference is for a platform with an existing reference implementation=
, accessible hardware documentation, and a reliable firmware recovery metho=
d. Used development boards or server motherboards would also be suitable if=
 they are available within my budget.
>
> My goal is to choose the most practical platform, build and validate an i=
nitial OpenBMC image, and gradually learn the hardware integration process =
before attempting to flash a physical BMC.
>
> I would be grateful for any recommendations on suitable hardware, existin=
g reference platforms, documentation, or practical guidance from developers=
 experienced in OpenBMC platform development.
>
> Thank you for your time and support.
>
> Best regards,
> Kavya M M


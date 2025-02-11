Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3B4C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 11:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSHQXJVDmU6SV3Z91F8kaCXOiiG5oCxvSWGJam0x8yg=; b=JaLw3hMh4YwRqpy8+VROOoirob
	P+FxW0FOHx1oU0FwEoXIx0Y+6g2Qgs+Fjvy/WXlrqdZkKI6/i0rZ+nrlbLL18KLF44+3fnZSpVs2l
	Z1bSwQUjUBD/Xd9Kyn2NJq385ud5RPhrBoF+Dkq+aaUNBvUDX+BHSoQKcRO+e4wbANUW4oKKFLl9F
	q1fhwH7FibUbxT9Kk+cgXNothxhJbQNNWpSLRWQRaZWZPHMcUO2QbWzGfdMDGP+tynissaepD6wPp
	kAMNqIs2IuHW3TJzF3UkdH7kKa488jA7UCsSOwSz9WfU5PdvbLQe+hGb7npIx0LDKHsfWq3wGZxp1
	QDq6yw6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thnzu-00000003S7U-0VmX;
	Tue, 11 Feb 2025 11:00:10 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thniY-00000003Odc-3Hiz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 10:42:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1739270529; x=1739875329; i=markus.elfring@web.de;
	bh=OSHQXJVDmU6SV3Z91F8kaCXOiiG5oCxvSWGJam0x8yg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bUvigBNkmTH4ndoVYsHo1tlhwRjjdsLA0gT18pYDXY3dbO7/VfsMZn/owZt7B//U
	 IQsSYbpYe1Is61sVML/6oL2bcYh3N9302gA0+3WgefBxmgrnpIpen6wZ1C4e1hCtg
	 Bd13dxoNNWGvt5ihg0Iyw12A6y5flqkVh5lDt96c6xz4/29ZzpGIO7m76aXA9l4rV
	 EbkV9mv8oeYFGkv5EUcVoMSwYN0FiTGIQTy92zLzkQT4xvPM6tq6k++v4lr29HeYt
	 zdXCIQtZjzUkoEEUo+qcnU+MlSzoK4uh9DdbEnXMR+hhYywgG9AlTHKwd9/jBFV8e
	 zyhB6iVy3aGq7SuSlQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.9]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MYLmq-1tuVKE3sVm-00Opoi; Tue, 11
 Feb 2025 11:42:08 +0100
Message-ID: <10bfed13-107f-4f84-967a-28985613dbfd@web.de>
Date: Tue, 11 Feb 2025 11:42:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] drm: xlnx: zynqmp_dpsub: Add NULL checks in
 zynqmp_audio_init()
To: Charles Han <hanchunchao@inspur.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Vishal Sagar <vishal.sagar@amd.com>
References: <20250211102049.6468-1-hanchunchao@inspur.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250211102049.6468-1-hanchunchao@inspur.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VF9iBVjP7Bc1WrNqr5ehNEGOQ+3CrQ4P+mDm8+nOW4HDm84jUYX
 +oGdg0sLuCAKmEtil8bp8BzGEhRo6M53GnxJoZRfkYDKEMCGqYMbhLQQ6CMAySNRIuJXjRD
 MjLlYCI/AI8yvMEU6JQYArWyR2jGIL/aJKljSEuLHFVxNHokFbojJGctVQuY3TYSjgZtNaK
 fEw8r2rH1Cu6je/gOlE4A==
UI-OutboundReport: notjunk:1;M01:P0:HdrVnq9INRc=;FnTXg7AbGVetljO/FZU2SzMHIjf
 WkMc/F7nJGWJNnb0SgAlMJHji/JO1vfL+mPH5WpzjReSujSFajQRixQ1hDAs9NgiwSYgA8Wg8
 1rAO58C3U+aqc6Bmrv9KyYH+PPJluhV0PzdSAFk9EhXt+B78TJkFwfJtYTCEhSRPGWYSjoNts
 xWdGE8saEIm/n6qj2a1E0CnmaRYjKent+JUiqFRKPSlludoQj7K7vEc1RQRLTtM0BWzbgcEbx
 XSxDnwrb3ORFEmNRfnXr3nSBs5XtiAISkfhb+9Cht2NmurFliidMOxlU+Pfql/w/pi2w0Vh7V
 jW+IRrz+L2Dla6sgTk+DEhu9L2uhy69Jq20uTQlDRjKELHxrRe7LCKosbnZ5EwJHpehQ1d70o
 Bu9s/AhAEzHFTdF4S31xiLByG/QdapbeaZ0ZUHGLwdt0RMtNBWF/SzSZRkZsAPcikrP+naQRU
 UQpMDt9I5tMXoeomDLEAwMdFNLuzALJoz7jei/1y+TPH74H6Cx75xqbbUM5UUaturutxnOAZT
 8eLqOtJb8YAZ7azFuR04vKbu6ZOlvW/dRZ58QmPB7VpVac9ivBektPjXVgSqoSdIkuk5KMF7R
 Hu4OmiY6IWXZY1326oaoreZcEpDJgMLOYyVubG2XsY/lIhbsHm0bNJsbrVNx8lL2cvDT6qpGX
 s7K5lo3UCU06Kk2btdKUre9sUOqO9Zn9WfeBSX1Znswaxqi8kiDIRc5fpd1WVT+9A9CKXpCc1
 cZtq5bxvPH+nVg/v0RJd4wmubNvLoO6dJvtT0ULM5wo6JdLPqhOXOKl6YwX8arA9YP6ptMVXi
 T+SjSFOYWfJFjbrR7zs/dqWCKhM8eAyblekmoa8mx0HsmTQP80v8BGHe4xYSlUZobkH9Tfs9w
 Imrx5vsN3me44QXDr91GGJx8teWo+OuBDIoZIJ5nWTsVgomGXxWMXxMwaXLPog25tt3TAsrne
 RIZ5joYaNpyMEgNdJGLW+NTFrndertUW4Fi3cHG3mlbb1dWtaPeESMejH8cUYn/Ce/zUpxSO9
 Jcg+q8eZC61MsHis7ezyfj/ynUd2piBPQEdpKyKK4dsZm0X6hETO68AlDLvtGXEw1+e9O6lZV
 HomOGQf+vA91/ZZWL2+nyWUM9pTt55dEPbekWyZgxWNe5gW8kyO+h6iasselSs/YwulIrBK4W
 E6MhCvbli0c/vrzwuMU43pY99wVp4ppAKabfzD/+eRfexUlHf2dDRRuvIIny9ekH2PCgpx+N9
 Kv6jBFncIGBnktdQJkLthJQAurODKHy9Vd3U1VEv1vt3QJh90RXDZ/8tn3x8qXCxRrBGDX9b5
 MvANZWbVnoK2Ve0DHxEiIr5reqC81ZGBpMhTIvAr2+ckoC1Ze/JlgQg9dFjonMF/m86hk/HH3
 zHGZLppQX5tb8ru+GdLGldwO5szN88sQbulWLJLsSG5Tmia3OHsVeoEYWPIg2NJqC6rNeVicP
 6OueuBYbr4TIp6LFEDqwUJDBGmaY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_024215_137060_F34EA763 
X-CRM114-Status: UNSURE (   5.18  )
X-CRM114-Notice: Please train this message.
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

=E2=80=A6
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp_audio.c | 4 ++++
=E2=80=A6

See also:
https://lore.kernel.org/all/?q=3D%22This+looks+like+a+new+version+of+a+pre=
viously+submitted+patch%22
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.14-rc2#n310


>> I will read these documents carefully.

I would miss more desirable effects accordingly.

Regards,
Markus


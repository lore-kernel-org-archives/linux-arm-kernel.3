Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43432D29C2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 15:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ojAcyD2Fn36e5mme/ci0t2x+CyHMMjUBO9peIt/uldo=; b=qx/n5qF+5bQsv+10eCpnwClz16
	/eSWdupWl3pAN9/X8o57gkJqgfZQm7W6AaRft4hBrGSVDsopmn0h4oe/X+NBdwlb8KqSmtdO58vhM
	ur1lPaUILrc6ycPa8AUbkZ/Go/o5mDEEgbSHywAp0Qv5Q89VZDgXQQ6MlBCK2CGbvbBHgrHQSrVai
	pvISISpW1God7ztRzjd6L2xdztm+aXUBcvhuT9IfALdR9eRModja5DV43GD13DZzDh8kFuAREpHzM
	VB0a8wV4TW5gqn+AogFezy6ATySMw1gBUaREvyXTv879z2GwHLPsM+G7YNHo7TmeILUjZoPP1EzWa
	rZtCZS0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrOc-00000002NKP-2mRp;
	Mon, 19 Jan 2026 15:42:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrOV-00000002NJO-3XRB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 15:42:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBD81497;
	Mon, 19 Jan 2026 07:42:05 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 583533F694;
	Mon, 19 Jan 2026 07:42:10 -0800 (PST)
Date: Mon, 19 Jan 2026 15:42:03 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Elif Topuz <elif.topuz@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	sudeep.holla@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, d-gole@ti.com,
	jonathan.cameron@huawei.com, lukasz.luba@arm.com,
	philip.radford@arm.com, souvik.chakravarty@arm.com
Subject: Re: [PATCH v2 12/17] firmware: arm_scmi: Add Telemetry components
 view
Message-ID: <aW5Qy22usmoxVfBE@pluto>
References: <20260114114638.2290765-1-cristian.marussi@arm.com>
 <20260114114638.2290765-13-cristian.marussi@arm.com>
 <c720119f-0991-4112-a080-829a7b2de908@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c720119f-0991-4112-a080-829a7b2de908@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_074219_967019_40B2A2E5 
X-CRM114-Status: GOOD (  21.88  )
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

On Fri, Jan 16, 2026 at 01:35:00PM +0000, Elif Topuz wrote:
> 
> Hi Cristian,

H Elif,

> 
> On 14/01/2026 11:46, Cristian Marussi wrote:
> > Add an alternative filesystem view for the discovered Data Events, where
> > the tree of DEs is laid out following the discovered topological order
> > instead of the existing flat layout.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> > v1 --> v2
> >  - Use new FS API
> >  - Introduce new stlmfs_lookup_by_name helper
> > ---
> >  .../firmware/arm_scmi/scmi_system_telemetry.c | 684 ++++++++++++++++++
> >  1 file changed, 684 insertions(+)
> > 
> > diff --git a/drivers/firmware/arm_scmi/scmi_system_telemetry.c b/drivers/firmware/arm_scmi/scmi_system_telemetry.c
> > index 721de615bec3..1221520356fd 100644
> > --- a/drivers/firmware/arm_scmi/scmi_system_telemetry.c
> > +++ b/drivers/firmware/arm_scmi/scmi_system_telemetry.c
> > @@ -174,6 +174,7 @@ struct scmi_tlm_inode {
> >   * @top_dentry: A reference to the top dentry for this instance.
> >   * @des_dentry: A reference to the DES dentry for this instance.
> >   * @grps_dentry: A reference to the groups dentry for this instance.
> > + * @compo_dentry: A reference to the components dentry for this instance.
> >   * @info: A handy reference to this instance SCMI Telemetry info data.
> >   *
> >   */
> > @@ -188,6 +189,7 @@ struct scmi_tlm_instance {
> >  	struct dentry *top_dentry;
> >  	struct dentry *des_dentry;
> >  	struct dentry *grps_dentry;
> > +	struct dentry *compo_dentry;
> >  	const struct scmi_telemetry_info *info;
> >  };
> >  
> > @@ -196,6 +198,526 @@ static int scmi_telemetry_instance_register(struct super_block *sb,
> >  
> >  static LIST_HEAD(scmi_telemetry_instances);
> >  
> > +#define TYPES_ARRAY_SZ		256
> > +
> > +static const char *compo_types[TYPES_ARRAY_SZ] = {
> > +	"unspec",
> > +	"cpu",
> > +	"cluster",
> > +	"gpu",
> > +	"npu",
> > +	"interconnnect",
> > +	"mem_cntrl",
> > +	"l1_cache",
> > +	"l2_cache",
> > +	"l3_cache",
> > +	"ll_cache",
> > +	"sys_cache",
> > +	"disp_cntrl",
> > +	"ipu",
> > +	"chiplet",
> > +	"package",
> > +	"soc",
> > +	"system",
> > +	"smcu",
> > +	"accel",
> > +	"battery",
> > +	"charger",
> > +	"pmic",
> > +	"board",
> > +	"memory",
> > +	"periph",
> > +	"periph_subc",
> > +	"lid",
> > +	"display",
> > +	"res_29",
> > +	"res_30",
> > +	"res_31",
> > +	"res_32",
> > +	"res_33",
> > +	"res_34",
> > +	"res_35",
> > +	"res_36",
> > +	"res_37",
> > +	"res_38",
> > +	"res_39",
> > +	"res_40",
> > +	"res_41",
> > +	"res_42",
> > +	"res_43",
> > +	"res_44",
> > +	"res_45",
> > +	"res_46",
> > +	"res_47",
> > +	"res_48",
> > +	"res_49",
> > +	"res_50",
> > +	"res_51",
> > +	"res_52",
> > +	"res_53",
> > +	"res_54",
> > +	"res_55",
> > +	"res_56",
> > +	"res_57",
> > +	"res_58",
> > +	"res_59",
> > +	"res_60",
> > +	"res_61",
> > +	"res_62",
> > +	"res_63",
> > +	"res_64",
> > +	"res_65",
> > +	"res_66",
> > +	"res_67",
> > +	"res_68",
> > +	"res_69",
> > +	"res_70",
> > +	"res_71",
> > +	"res_72",
> > +	"res_73",
> > +	"res_74",
> > +	"res_75",
> > +	"res_76",
> > +	"res_77",
> > +	"res_78",
> > +	"res_79",
> > +	"res_80",
> > +	"res_81",
> > +	"res_82",
> > +	"res_83",
> > +	"res_84",
> > +	"res_85",
> > +	"res_86",
> > +	"res_87",
> > +	"res_88",
> > +	"res_89",
> > +	"res_90",
> > +	"res_91",
> > +	"res_92",
> > +	"res_93",
> > +	"res_94",
> > +	"res_95",
> > +	"res_96",
> > +	"res_97",
> > +	"res_98",
> > +	"res_99",
> > +	"res_100",
> > +	"res_101",
> > +	"res_102",
> > +	"res_103",
> > +	"res_104",
> > +	"res_105",
> > +	"res_106",
> > +	"res_107",
> > +	"res_108",
> > +	"res_109",
> > +	"res_110",
> > +	"res_111",
> > +	"res_112",
> > +	"res_113",
> > +	"res_114",
> > +	"res_115",
> > +	"res_116",
> > +	"res_117",
> > +	"res_118",
> > +	"res_119",
> > +	"res_120",
> > +	"res_121",
> > +	"res_122",
> > +	"res_123",
> > +	"res_124",
> > +	"res_125",
> > +	"res_126",
> > +	"res_127",
> > +	"res_128",
> > +	"res_129",
> > +	"res_130",
> > +	"res_131",
> > +	"res_132",
> > +	"res_133",
> > +	"res_134",
> > +	"res_135",
> > +	"res_136",
> > +	"res_137",
> > +	"res_138",
> > +	"res_139",
> > +	"res_140",
> > +	"res_141",
> > +	"res_142",
> > +	"res_143",
> > +	"res_144",
> > +	"res_145",
> > +	"res_146",
> > +	"res_147",
> > +	"res_148",
> > +	"res_149",
> > +	"res_150",
> > +	"res_151",
> > +	"res_152",
> > +	"res_153",
> > +	"res_154",
> > +	"res_155",
> > +	"res_156",
> > +	"res_157",
> > +	"res_158",
> > +	"res_159",
> > +	"res_160",
> > +	"res_161",
> > +	"res_162",
> > +	"res_163",
> > +	"res_164",
> > +	"res_165",
> > +	"res_166",
> > +	"res_167",
> > +	"res_168",
> > +	"res_169",
> > +	"res_170",
> > +	"res_171",
> > +	"res_172",
> > +	"res_173",
> > +	"res_174",
> > +	"res_175",
> > +	"res_176",
> > +	"res_177",
> > +	"res_178",
> > +	"res_179",
> > +	"res_180",
> > +	"res_181",
> > +	"res_182",
> > +	"res_183",
> > +	"res_184",
> > +	"res_185",
> > +	"res_186",
> > +	"res_187",
> > +	"res_188",
> > +	"res_189",
> > +	"res_190",
> > +	"res_191",
> > +	"res_192",
> > +	"res_193",
> > +	"res_194",
> > +	"res_195",
> > +	"res_196",
> > +	"res_197",
> > +	"res_198",
> > +	"res_199",
> > +	"res_200",
> > +	"res_201",
> > +	"res_202",
> > +	"res_203",
> > +	"res_204",
> > +	"res_205",
> > +	"res_206",
> > +	"res_207",
> > +	"res_208",
> > +	"res_209",
> > +	"res_210",
> > +	"res_211",
> > +	"res_212",
> > +	"res_213",
> > +	"res_214",
> > +	"res_215",
> > +	"res_216",
> > +	"res_217",
> > +	"res_218",
> > +	"res_219",
> > +	"res_220",
> > +	"res_221",
> > +	"res_222",
> > +	"res_223",
> > +	"oem_224",
> > +	"oem_225",
> > +	"oem_226",
> > +	"oem_227",
> > +	"oem_228",
> > +	"oem_229",
> > +	"oem_230",
> > +	"oem_231",
> > +	"oem_232",
> > +	"oem_233",
> > +	"oem_234",
> > +	"oem_235",
> > +	"oem_236",
> > +	"oem_237",
> > +	"oem_238",
> > +	"oem_239",
> > +	"oem_240",
> > +	"oem_241",
> > +	"oem_242",
> > +	"oem_243",
> > +	"oem_244",
> > +	"oem_245",
> > +	"oem_246",
> > +	"oem_247",
> > +	"oem_248",
> > +	"oem_249",
> > +	"oem_250",
> > +	"oem_251",
> > +	"oem_252",
> > +	"oem_253",
> > +	"oem_254",
> > +	"oem_255",
> > +};
> > +
> > +static const char *unit_types[TYPES_ARRAY_SZ] = {
> > +	"none",
> > +	"unspec",
> > +	"celsius",
> > +	"fahrenheit",
> > +	"kelvin",
> > +	"volts",
> > +	"amps",
> > +	"watts",
> > +	"joules",
> > +	"coulombs",
> > +	"va",
> > +	"nits",
> > +	"lumens",
> > +	"lux",
> > +	"candelas",
> > +	"kpa",
> > +	"psi",
> > +	"newtons",
> > +	"cfm",
> > +	"rpm",
> > +	"hertz",
> > +	"seconds",
> > +	"minutes",
> > +	"hours",
> > +	"days",
> > +	"weeks",
> > +	"mils",
> > +	"inches",
> > +	"feet",
> > +	"cubic_inches",
> > +	"cubic_feet",
> > +	"meters",
> > +	"cubic_centimeters",
> > +	"cubic_meters",
> > +	"liters",
> > +	"fluid_ounces",
> > +	"radians",
> > +	"steradians",
> > +	"revolutions",
> > +	"cycles",
> > +	"gravities",
> > +	"ounces",
> > +	"pounds",
> > +	"foot_pounds",
> > +	"ounce_inches",
> > +	"gauss",
> > +	"gilberts",
> > +	"henries",
> > +	"farads",
> > +	"ohms",
> > +	"siemens",
> > +	"moles",
> > +	"becquerels",
> > +	"ppm",
> > +	"decibels",
> > +	"dba",
> > +	"dbc",
> > +	"grays",
> > +	"sieverts",
> > +	"color_temp_kelvin",
> > +	"bits",
> > +	"bytes",
> > +	"words",
> > +	"dwords",
> > +	"qwords",
> > +	"percentage",
> > +	"pascals",
> > +	"counts",
> > +	"grams",
> > +	"newton_meters",
> > +	"hits",
> > +	"misses",
> > +	"retries",
> > +	"overruns",
> > +	"underruns",
> > +	"collisions",
> > +	"packets",
> > +	"messages",
> > +	"chars",
> > +	"errors",
> > +	"corrected_err",
> > +	"uncorrectable_err",
> > +	"square_mils",
> > +	"square_inches",
> > +	"square_feet",
> > +	"square_centimeters",
> > +	"square_meters",
> > +	"radians_per_secs",
> > +	"beats_per_minute",
> > +	"meters_per_secs_squared",
> > +	"meters_per_secs",
> > +	"cubic_meter_per_secs",
> > +	"millimeters_mercury",
> > +	"radians_per_secs_squared",
> > +	"state",
> > +	"bps",
> > +	"res_96",
> > +	"res_97",
> > +	"res_98",
> > +	"res_99",
> > +	"res_100",
> > +	"res_101",
> > +	"res_102",
> > +	"res_103",
> > +	"res_104",
> > +	"res_105",
> > +	"res_106",
> > +	"res_107",
> > +	"res_108",
> > +	"res_109",
> > +	"res_110",
> > +	"res_111",
> > +	"res_112",
> > +	"res_113",
> > +	"res_114",
> > +	"res_115",
> > +	"res_116",
> > +	"res_117",
> > +	"res_118",
> > +	"res_119",
> > +	"res_120",
> > +	"res_121",
> > +	"res_122",
> > +	"res_123",
> > +	"res_124",
> > +	"res_125",
> > +	"res_126",
> > +	"res_127",
> > +	"res_128",
> > +	"res_129",
> > +	"res_130",
> > +	"res_131",
> > +	"res_132",
> > +	"res_133",
> > +	"res_134",
> > +	"res_135",
> > +	"res_136",
> > +	"res_137",
> > +	"res_138",
> > +	"res_139",
> > +	"res_140",
> > +	"res_141",
> > +	"res_142",
> > +	"res_143",
> > +	"res_144",
> > +	"res_145",
> > +	"res_146",
> > +	"res_147",
> > +	"res_148",
> > +	"res_149",
> > +	"res_150",
> > +	"res_151",
> > +	"res_152",
> > +	"res_153",
> > +	"res_154",
> > +	"res_155",
> > +	"res_156",
> > +	"res_157",
> > +	"res_158",
> > +	"res_159",
> > +	"res_160",
> > +	"res_161",
> > +	"res_162",
> > +	"res_163",
> > +	"res_164",
> > +	"res_165",
> > +	"res_166",
> > +	"res_167",
> > +	"res_168",
> > +	"res_169",
> > +	"res_170",
> > +	"res_171",
> > +	"res_172",
> > +	"res_173",
> > +	"res_174",
> > +	"res_175",
> > +	"res_176",
> > +	"res_177",
> > +	"res_178",
> > +	"res_179",
> > +	"res_180",
> > +	"res_181",
> > +	"res_182",
> > +	"res_183",
> > +	"res_184",
> > +	"res_185",
> > +	"res_186",
> > +	"res_187",
> > +	"res_188",
> > +	"res_189",
> > +	"res_190",
> > +	"res_191",
> > +	"res_192",
> > +	"res_193",
> > +	"res_194",
> > +	"res_195",
> > +	"res_196",
> > +	"res_197",
> > +	"res_198",
> > +	"res_199",
> > +	"res_200",
> > +	"res_201",
> > +	"res_202",
> > +	"res_203",
> > +	"res_204",
> > +	"res_205",
> > +	"res_206",
> > +	"res_207",
> > +	"res_208",
> > +	"res_209",
> > +	"res_210",
> > +	"res_211",
> > +	"res_212",
> > +	"res_213",
> > +	"res_214",
> > +	"res_215",
> > +	"res_216",
> > +	"res_217",
> > +	"res_218",
> > +	"res_219",
> > +	"res_220",
> > +	"res_221",
> > +	"res_222",
> > +	"res_223",
> > +	"res_224",
> > +	"res_225",
> > +	"res_226",
> > +	"res_227",
> > +	"res_228",
> > +	"res_229",
> > +	"res_230",
> > +	"res_231",
> > +	"res_232",
> > +	"res_233",
> > +	"res_234",
> > +	"res_235",
> > +	"res_236",
> > +	"res_237",
> > +	"res_238",
> > +	"res_239",
> > +	"res_240",
> > +	"res_241",
> > +	"res_242",
> > +	"res_243",
> > +	"res_244",
> > +	"res_245",
> > +	"res_246",
> > +	"res_247",
> > +	"res_248",
> > +	"res_249",
> > +	"res_250",
> > +	"res_251",
> > +	"res_252",
> > +	"res_253",
> > +	"res_254",
> > +	"oem_unit",
> > +};
> > +
> >  static struct inode *stlmfs_get_inode(struct super_block *sb)
> >  {
> >  	struct inode *inode = new_inode(sb);
> > @@ -815,6 +1337,18 @@ DEFINE_TLM_CLASS(persistent_tlmo, "persistent", 0,
> >  DEFINE_TLM_CLASS(value_tlmo, "value", 0,
> >  		 S_IFREG | S_IRUSR, &de_read_fops, NULL);
> >  
> > +static inline struct dentry *
> > +stlmfs_lookup_by_name(struct dentry *parent, const char *dname)
> > +{
> > +	struct qstr qstr;
> > +
> > +	qstr.name = dname;
> > +	qstr.len = strlen(dname);
> > +	qstr.hash = full_name_hash(parent, qstr.name, qstr.len);
> > +
> > +	return d_lookup(parent, &qstr);
> > +}
> > +
> >  static int scmi_telemetry_de_populate(struct super_block *sb,
> >  				      struct scmi_tlm_setup *tsp,
> >  				      struct dentry *parent,
> > @@ -1659,6 +2193,150 @@ static struct dentry *stlmfs_create_root_dentry(struct super_block *sb)
> >  	return dentry;
> >  }
> >  
> > +static int scmi_telemetry_de_subdir_symlink(struct super_block *sb,
> > +					    struct scmi_tlm_setup *tsp,
> > +					    const struct scmi_telemetry_de *de,
> > +					    struct dentry *parent)
> > +{
> > +	struct dentry *dentry;
> > +	struct inode *inode;
> > +	int ret;
> I notice that ret isn't assigned a value and the function returns ret without
> initialising.
>

Yep, my bad: I think it is just a leftover from some last minute cleanup
I have done...it seems to cause only harmless (but noisy) error
messages...thanks for testing...I will fix !

> > +
> > +	if (IS_ERR(parent))
> >  

[snip]

> 
> I will continue reviewing,

Yes please, thanks for having a look.

Thanks,
Cristian

